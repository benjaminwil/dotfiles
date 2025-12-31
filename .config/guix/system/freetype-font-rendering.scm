(define-module (system freetype-font-rendering)
  #:use-module (gnu)
  #:use-module (gnu services shepherd)
  #:export (freetype-font-rendering-service))

(define freetype-properties-environment-variable
  `(("FREETYPE_PROPERTIES" .
    (string-append "cff:no-stem-darkening=0 "
                   "cff:darkening-parameters=500,400,1000,350,1500,325,2000,300 "
                   "autofitter:no-stem-darkening=0 "
                   "autofitter:darkening-parameters=500,400,1000,350,1500,325,2000,300"))))

(define-public freetype-font-rendering-service
  (simple-service 'freetype-font-rendering-service
                  session-environment-service-type
                  freetype-properties-environment-variable))
