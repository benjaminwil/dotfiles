(list (channel
        (name 'bwix)
        (branch "main")
        (url "https://codeberg.org/benjaminwil/bwix"))

      (channel
        (name 'saayix)
        (branch "main")
        (url "https://codeberg.org/look/saayix")
        (introduction
        (make-channel-introduction
          "12540f593092e9a177eb8a974a57bb4892327752"
          (openpgp-fingerprint
            "3FFA 7335 973E 0A49 47FC  0A8C 38D5 96BE 07D3 34AB"))))

      (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (branch "master")
        (commit
          "f5338f63fce69622ce06f93fe02524967e1f30d4")
        (introduction
          (make-channel-introduction
            "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
            (openpgp-fingerprint
              "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))

      (channel
        (name 'guix)
        (url "https://codeberg.org/guix/guix.git")
        (branch "master")
        (commit
          "6a62ff0170a5deaa4f0f5a6e2e51cd4ac33dc513")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
