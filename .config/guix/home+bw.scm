(define-module (guix-home-config)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages version-control)
  #:use-module (gnu services)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services sound)
  #:use-module (gnu home services syncthing)

  #:use-module (gnu system shadow)
  #:use-module (bwix packages playdate-sdk)

(home-environment
  (packages (list fzy
                  git
                  gnupg
                  htop
                  icedove
                  kakoune
                  kak-lsp
                  kitty
                  nnn
                  openssh
                  password-store
                  ripgrep
                  senpai))
  (services (list
             (service home-dbus-service-type)
             (service home-playdate-sdk-service-type)
             (service home-pipewire-service-type)
             (service home-symlink-manager-service-type)
             (service home-syncthing-service-type
                      (for-home (syncthing-configuration (user "bw"))))
             (service home-xdg-mime-applications-service-type))))
