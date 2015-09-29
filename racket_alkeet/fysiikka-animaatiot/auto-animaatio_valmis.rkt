;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname auto-animaatio_valmis) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(require teachpacks/display-read)
(define KORKEUS 300)
(define LEVEYS 1000)
(define AUTO-Y 200)
(define TAUSTA (empty-scene LEVEYS KORKEUS))

(define v1 (string->number (display-read "Anna punaisen auton nopeus (m/s)")))
(define v2 (string->number (display-read "Anna sinisen auton nopeus (m/s)")))

(define (piirrä-auto väri nopeus teksti)
  (overlay (text (string-append (number->string nopeus) teksti) 30 "white")
           (overlay/xy  (overlay/xy (circle 25 "solid" "black")
                                    60 0
                                    (circle 25 "solid" "black"))
                        -3 -50
                        (rectangle 120 80 "solid" väri))))
              
(define (päivitä-animaatio t)
  (place-image (piirrä-auto "blue" v2 "(m/s)") (s2 (/ t 28)) AUTO-Y
               (place-image  (piirrä-auto "red" v1 "(m/s)")(s1 (/ t 28)) AUTO-Y TAUSTA)))

; s1 : Luku -> Luku
(check-expect (s1 50) (* v1 50)) 
(define (s1 t)
  (* v1 t))

; s2 : Luku -> Luku 
(check-expect (s2 50) (* v2 50)) 
(define (s2 t)
  (* v2 t))

(big-bang 0
          (to-draw päivitä-animaatio)
          (on-tick add1))

; (require plot)
; (plot (list (axes)(function s1 0 100)(function s2 0 100)))