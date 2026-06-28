(define-module (system framework-wakeup-devices)
  #:use-module (gnu services)
  #:use-module (guix gexp))

(define wakeup-devices '("XHC0"))

(define no-wakeup-devices
  '("GPP0"
    "GPP1"
    "GPP3"
    "GPP5"
    "XHC1"
    "XHC3"
    "XHC4"
    "NHI0"
    "NHI1"))

(define %wakeup-activation-gexp
  #~(begin
      (use-modules (ice-9 rdelim)
                   (ice-9 regex))

      (define (get-enabled-devices)
        (call-with-input-file "/proc/acpi/wakeup"
          (lambda (port)
            (let loop ((line (read-line port))
                       (enabled '()))
              (if (eof-object? line)
                  enabled
                  (let ((match (string-match "^([A-Z0-9]+)[[:space:]]+S[0-5][*[:space:]]+(\\*enabled)" line)))
                    (if match
                        (loop (read-line port) (cons (match:substring match 1) enabled))
                        (loop (read-line port) enabled))))))))

      (define (toggle-device! dev)
        (call-with-output-file "/proc/acpi/wakeup"
          (lambda (port)
            (display dev port)
            (newline port))))

      (let ((currently-enabled (get-enabled-devices)))
        (for-each
         (lambda (device)
           (unless (member device '#$wakeup-devices)
             (when (member device currently-enabled)
               (toggle-device! device))))
         '#$no-wakeup-devices))))

(define-public framework-wakeup-service-type
  (service-type
   (name 'framework-wakeup)
   (description "Disable ACPI various wakeup devices on my laptop.")
   (default-value #f)
   (extensions
    (list (service-extension
           activation-service-type
           (const %wakeup-activation-gexp))))))
