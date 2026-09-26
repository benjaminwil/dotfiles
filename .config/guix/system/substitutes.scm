(define-module (system substitutes)
  #:use-module (gnu)
  #:use-module (gnu services)
  #:use-module (guix records)
  #:export (nonguix-substitutes-service))

(define nonguix-public-signing-key
  (plain-file "non-guix.pub"
            "(public-key (ecc (curve Ed25519) (q #C1FD53E5D4CE971933EC50C9F307AE2171A2D3B52C804642A7A35F84F3A4EA98#)))"))

(define nonguix-substitutes-service
  (simple-service 'nonguix-substitutes-service guix-service-type
                  (guix-extension
                   (substitute-urls (list "https://substitutes.nonguix.org"))
                   (authorized-keys (list nonguix-public-signing-key)))))
