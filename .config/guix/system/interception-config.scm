;; -*- mode: scheme; -*-

(define-module (system interception-config)
  #:use-module (gnu)
  #:use-module (gnu packages linux)
  #:use-module (gnu services shepherd)
  #:use-module (guix utils)
  #:export (interception-udevmon-service)
  #:export (interception-dual-function-keys-config))

(define dual-function-keys-etc-file-path
   "interception/dual-function-keys/keyboard.yaml")

(define intercept-command "/bin/intercept -g $DEVNODE")
(define dual-function-keys-command
   (string-append "/bin/dual-function-keys -c /etc/"
                  dual-function-keys-etc-file-path))
(define uinput-command "/bin/uinput -d $DEVNODE")

(define interception-tools-config
  (mixed-text-file "interception-tools.yaml" "- JOB: "
     (file-append interception-tools intercept-command) " | "
     (file-append interception-dual-function-keys dual-function-keys-command) " | "
     (file-append interception-tools uinput-command) "
  DEVICE:
    NAME: 'AT Translated Set 2 keyboard'"))

(define interception-dual-function-keys-config
  (plain-file "keyboard.yaml" "\
TIMING:
  TAP_MILLISEC: 200
  DOUBLE_TAP_MILLISEC: 150

MAPPINGS:
  - KEY: KEY_CAPSLOCK
    TAP: KEY_ESC
    HOLD: KEY_LEFTCTRL
"))

(define-public interception-udevmon-service
  (simple-service 'interception-udevmon-service shepherd-root-service-type
                  (list (shepherd-service
                         (documentation "TODO")
                         (provision '(interception-udevmon))
                         (requirement '(udev))
                         (start #~(make-forkexec-constructor
                                   (list #$(file-append interception-tools "/bin/udevmon"))
                                   #:log-file "/var/log/interception-udevmon.log"))
                         (stop #~(make-kill-destructor))))))

(define-public interception-dual-function-keys-config
  (simple-service 'interception-dual-function-keys-config etc-service-type
                  (list
                   `(,dual-function-keys-etc-file-path ,interception-dual-function-keys-config)
                   `("interception/udevmon.d/interception-tools.yaml" ,interception-tools-config))))
