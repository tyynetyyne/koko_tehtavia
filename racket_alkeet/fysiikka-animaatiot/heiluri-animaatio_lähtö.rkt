;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname heiluri-animaatio_lähtö) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(require teachpacks/display-read)
(define KORKEUS 300)
(define LEVEYS 500)
(define 10CM 10)    ; mittakaava 10px = 10cm  
(define ASTEIKKO (rectangle LEVEYS (* 5 10CM) "outline" "black"))
(define 50CM-ASTEIKKO (put-pinhole (/ LEVEYS 2) 50 (above ASTEIKKO ASTEIKKO ASTEIKKO ASTEIKKO ASTEIKKO)))
(define TAUSTA (put-pinhole (/ LEVEYS 2) 50 (overlay/pinhole 50CM-ASTEIKKO (empty-scene LEVEYS KORKEUS))))
(define g 9.8)

(define L (string->number (display-read "Anna heilurin pituus")))
(define theta0 (string->number (display-read "Anna lähtökulma")))

(define (piirrä-heiluri l)
  (above
    (rectangle 8 l "solid" "black")
    (circle 10 "solid" "red")))

(define (käännä-heiluri a kuva)
  (rotate a (put-pinhole (/ (image-width kuva) 2) 0 kuva)))

(define (päivitä-animaatio t)
  (crop 0 0 LEVEYS KORKEUS (overlay/pinhole (käännä-heiluri (theta (/ t 2)) (piirrä-heiluri L)) TAUSTA)))

(define (theta t)
 0)

(big-bang 0
          (to-draw päivitä-animaatio)
          (on-tick add1))

; (require plot)
; (plot (function theta 0 100))
