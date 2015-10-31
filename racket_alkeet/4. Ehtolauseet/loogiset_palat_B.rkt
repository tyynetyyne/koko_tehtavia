;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname loogiset_palat_B) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Loogiset palat B

(require 2htdp/image)
(require math)        ; degrees->radians

(define REIKÄ (circle 4 "solid" "white"))
(define PIENI-SIVU 30)
(define ISO-SIVU 50)
(define PIENI-KOLMION-SIVU (sqrt (+ (sqr (/ PIENI-SIVU 2))(sqr PIENI-SIVU))))   ; Pythagoraan lause
(define ISO-KOLMION-SIVU (sqrt (+ (sqr (/ ISO-SIVU 2))(sqr ISO-SIVU))))         ; Pythagoraan lause 
(define ISO-SÄDE (/ ISO-SIVU 2))
(define PIENI-SÄDE (/ PIENI-SIVU 2))
(define VÄLI (square 10 0 "transparent"))

; kolmio : Luku Väri Totuusarvo -> Kuva
(define (kolmio sivu väri reikä?)
  (if (not reikä?)
      (triangle sivu "solid" väri)
      (overlay/xy
       REIKÄ
       (* -0.5 (- sivu 8))        
       (* (- sivu) (sin (degrees->radians 60)) 0.5)
       (triangle sivu "solid" väri))))

(check-expect (kolmio 50 "red" false)
              (triangle 50 "solid" "red"))

(check-expect (kolmio 50 "red" true)
              (overlay/xy
               REIKÄ
               (* -0.5 (- 50 8))
               (* -50 (sin (degrees->radians 60)) 0.5)
               (triangle 50 "solid" "red")))

;; rivi : Merkkijono Väri -> Kuva
(define (rivi muoto väri)
  (cond [(string=? muoto "kolmio")
         (beside (kolmio ISO-KOLMION-SIVU väri false)VÄLI
                 (kolmio ISO-KOLMION-SIVU väri true)VÄLI
                 (kolmio PIENI-KOLMION-SIVU väri false)VÄLI
                 (kolmio PIENI-KOLMION-SIVU väri true))]
        [else
         empty-image]))

 (above (rivi "kolmio" "red")
        (rivi "kolmio" "green")
        (rivi "kolmio" "blue")
        (rivi "kolmio" "yellow"))