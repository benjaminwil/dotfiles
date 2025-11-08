;; -*- mode: scheme; -*-

(use-modules (gnu)
             (gnu services)
             (gnu system nss)

             (guix utils)

             (nongnu packages linux)
             (nongnu system linux-initrd)

             ;; Local modules I wrote or lifted from other GNU Guix users. :-)
             (system boltd)
             (system gnome-customization)
             (system interception-config)
             (system private))

(use-package-modules gnome gnome-xyz gnupg gstreamer)
(use-service-modules desktop linux sddm shepherd sound xorg)

(define %my-desktop-services
  (modify-services %desktop-services
                   (delete pulseaudio-service-type)
                   (delete alsa-service-type)))

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware amdgpu-firmware))

  (host-name "slipped")
  (timezone "America/Vancouver")
  (locale "en_US.utf8")
  (keyboard-layout (keyboard-layout "us" "altgr-intl"))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets '("/boot/efi"))
                (keyboard-layout keyboard-layout)))

  ;; Specifies a mapped device for the encrypted root partition. The UUID
  ;; returned by `cryptsetup luksUUID`.
  (mapped-devices
   (list (mapped-device
          (source (uuid root-partition-uuid))
          (target "system-root")
          (type luks-device-mapping))))

  (file-systems (append
                 (list (file-system
                         (device (file-system-label "system-root"))
                         (mount-point "/")
                         (type "ext4")
                         (dependencies mapped-devices))
                       (file-system
                         (device (uuid efi-partition-uuid 'fat))
                         (mount-point "/boot/efi")
                         (type "vfat")))
                 %base-file-systems))

  ;; Specifies a swap file, which resides on the root file system.
  (swap-devices (list (swap-space
                       (target "/swapfile"))))

  (users (cons (user-account
                (name "bw")
                (group "users")
                (supplementary-groups '("wheel" "netdev" "audio" "video")))
               %base-user-accounts))

  ;; This is where we specify system-wide packages.
  (packages (append (list
                     bibata-cursor-theme ;; Self-explanatory, I think.
                     gnome-tweaks        ;; Exposes additional Gnome settings.
                     gst-libav           ;; Play web videos in Gnome Web.
                     gvfs                ;; For user mounts.
                     pinentry-tty        ;; For console GPG passphrase entry.
                    )
                    %base-packages))

  ;; And this is where we specify system-side services, including the desktop
  ;; environment and so on.
  (services (append (list
                     (service bluetooth-service-type)
                     (service boltd-service-type)
                     (service gnome-desktop-service-type)
                     (service xfce-desktop-service-type)
                     (set-xorg-configuration
                       (xorg-configuration
                         (keyboard-layout keyboard-layout))))
                    (list
                     gnome-fractional-scaling-enable-service
                     interception-udevmon-service
                     interception-dual-function-keys-config)
                    %my-desktop-services))

  ;; Allows the resolution of `.local` host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
