;; -*- mode: scheme; -*-

(use-modules (gnu)
             (gnu packages android)
             (gnu packages audio)
             (gnu packages linux)
             (gnu services)
             (gnu services containers)
             (gnu services networking)
             (gnu services pm)
             (gnu system accounts)
             (gnu system nss)

             (guix utils)

             (nongnu packages linux)
             (nongnu system linux-initrd)

             (bwix packages playdate-sdk)

             ;; Local modules I wrote or lifted from other GNU Guix users. :-)
             (system boltd)
             (system framework-wakeup-devices)
             (system freetype-font-rendering)
             (system gnome-customization)
             (system interception-config)
             (system private))

(use-package-modules gnome gnome-xyz gnupg gstreamer)
(use-service-modules desktop linux sddm shepherd sound xorg)

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
                         (device (uuid storage-ext-partition-uuid))
                         (mount-point "/storage/ext")
                         (type "ext4"))
                       (file-system
                         (device (uuid efi-partition-uuid 'fat))
                         (mount-point "/boot/efi")
                         (type "vfat")))
                 %base-file-systems))

  ;; Specifies a swap file, which resides on the root file system.
  (swap-devices (list (swap-space
                       (target "/swapfile"))))

  ;; "adbusers" and "plugdev" are for Android device connectivity via ADB, and
  ;; "realtime" is a conventional group for realtime audio processes.
  (groups (cons* (user-group (name "realtime") (system? #t))
                 (user-group (name "adbusers") (system? #t))
                 (user-group (name "plugdev") (system? #t))
                %base-groups))

  (users (cons* (user-account
                (name "bw")
                (group "users")
                (supplementary-groups
                 '("wheel"
                   "adbusers"
                   "audio"
                   "cgroup"
                   "kvm"
                   "netdev"
                   "plugdev"
                   "realtime"
                   "video")))
               %base-user-accounts))

  ;; This is where we specify system-wide packages.
  (packages (append (list
                     bibata-cursor-theme ;; Self-explanatory, I think.

                     ;; Ensure the Bolt package is available so that udev
                     ;; rules are installed and so on.
                     bolt

                     gnome-tweaks        ;; Exposes additional Gnome settings.
                     gst-libav           ;; Play web videos in Gnome Web.
                     gvfs                ;; For user mounts.

                     jack-2

                     pinentry-tty        ;; For console GPG passphrase entry.
                    )
                    %base-packages))

  ;; And this is where we specify system-side services, including the desktop
  ;; environment and so on.
  (services (append (list
                     (service bluetooth-service-type)
                     (service boltd-service-type)
                     (service framework-wakeup-service-type)
                     (service gnome-desktop-service-type)
                     (service pam-limits-service-type
                              (list
                               (pam-limits-entry "@realtime" 'both 'rtprio 99)
                               (pam-limits-entry "@realtime" 'both 'memlock 'unlimited)))
                     (service iptables-service-type)
                     (service rootless-podman-service-type
                      (rootless-podman-configuration
                       (subuids (list (subid-range (name "bw") (start 100000) (count 65536))))
                       (subgids (list (subid-range (name "bw") (start 100000) (count 65536))))))
                     (service tlp-service-type
                      (tlp-configuration
                       (runtime-pm-on-ac "on")
                       (runtime-pm-on-bat "auto")
                       (runtime-pm-all? #t)))
                     (set-xorg-configuration
                       (xorg-configuration
                         (keyboard-layout keyboard-layout))))
                    (list
                     freetype-font-rendering-service
                     gnome-fractional-scaling-enable-service
                     interception-udevmon-service
                     interception-dual-function-keys-config
                     (udev-rules-service 'playdate playdate-sdk)
                     (udev-rules-service 'android android-udev-rules))
                    %desktop-services))

  ;; Allows the resolution of `.local` host names with mDNS.
  (name-service-switch %mdns-host-lookup-nss))
