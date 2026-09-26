(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services sound)
  #:use-module (gnu home services symlink-manager)
  #:use-module (gnu home services syncthing)
  #:use-module (gnu home services xdg)

  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xdisorg)

  #:use-module (gnu services)

  #:use-module (gnu system shadow)

  #:use-module (bwix packages foliate)
  #:use-module (bwix packages playdate-sdk)

  #:use-module (nongnu packages mozilla)

  #:use-module (saayix packages terminals)

  #:use-module (system private))


(home-environment
  (packages (list firefox
                  foliate
                  fzy
                  gcc-toolchain
                  ghostty
                  git
                  git-absorb
                  gnupg
                  htop
                  icedove
                  inkscape
                  kakoune
                  kak-lsp
                  nnn
                  openssh
                  password-store
                  ripgrep
                  senpai
                  tig
                  wl-clipboard
                  xdg-utils))
  (services (list
             (service home-dbus-service-type)
             (service home-playdate-sdk-service-type)
             (service home-pipewire-service-type)
             (service home-symlink-manager-service-type)
             (service home-syncthing-service-type
                      (for-home (syncthing-configuration
				 (user redacted-username-primary))))
             (service home-xdg-mime-applications-service-type
                      (home-xdg-mime-applications-configuration
                       (default
                         '((text/html . "firefox.desktop")
                           (x-scheme-handler/https . "firefox.desktop"))))))))
