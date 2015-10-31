;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname loogiset_palat_A) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; loogiset palat A

(require 2htdp/image)

(define REIKÄ (circle 4 "solid" "white"))
(define PIENI-SIVU 30)
(define ISO-SIVU 50)
(define ISO-SÄDE (/ ISO-SIVU 2))
(define PIENI-SÄDE (/ PIENI-SIVU 2))
(define VÄLI (square 10 0 "transparent"))

; neliö : Tyyppi Väri Totuusarvo -> Kuva
(define (neliö sivu väri reikä?)
  (if reikä?
      (overlay REIKÄ (square sivu "solid" väri))
      (square sivu "solid" väri)))

(check-expect (neliö 50 "red" false)
              (square 50 "solid" "red"))

(check-expect (neliö 50 "red" true)
              (overlay
               REIKÄ
               (square 50 "solid" "red")))

; ympyrä : Luku Väri Totuusarvo -> Kuva
(define (ympyrä säde väri reikä?)
  (if reikä?
      (overlay REIKÄ (circle säde "solid" väri))
      (circle säde "solid" väri)))

(check-expect (ympyrä 25 "red" false)
              (circle 25 "solid" "red"))

(check-expect (ympyrä 25 "red" true)
              (overlay
               REIKÄ
               (circle 25 "solid" "red")))

;; rivi : Merkkijono Väri -> Kuva
(define (rivi muoto väri)
  (cond [(string=? muoto "neliö")
         (beside (neliö ISO-SIVU väri false)VÄLI
                 (neliö ISO-SIVU väri true)VÄLI
                 (neliö PIENI-SIVU väri false)VÄLI
                 (neliö PIENI-SIVU väri true))]
        [(string=? muoto "ympyrä")
         (beside (ympyrä ISO-SÄDE väri false)VÄLI
                 (ympyrä ISO-SÄDE väri true)VÄLI
                 (ympyrä PIENI-SÄDE väri false)VÄLI
                 (ympyrä PIENI-SÄDE väri true))]
        [else
         empty-image]))

(above
 (above (rivi "neliö" "red")
        (rivi "neliö" "green")
        (rivi "neliö" "blue")
        (rivi "neliö" "yellow"))
 (above (rivi "ympyrä" "red")
        (rivi "ympyrä" "green")
        (rivi "ympyrä" "blue")
        (rivi "ympyrä" "yellow")))
