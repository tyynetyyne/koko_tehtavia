;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname yksiköt_malliratkaisuja) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; pinta-alan ja tilavuuden yksikköt
;; yksiköt->kuva : Merkkijono Luku -> Kuva
(define (yksiköt->kuva yksikkö eksponentti koko väri)
  (overlay/xy (text yksikkö koko väri)
              (image-width (text yksikkö koko väri)) 0
              (text (number->string eksponentti) (/ koko 2) väri)))

(check-expect (yksiköt->kuva "m" 2 30 "black")
              (overlay/xy (text "m" 30 "black")
                          (image-width (text "m" 30 "black")) 0
                          (text (number->string 2) 15 "black")))

;; esimerkkikuva:
(beside (yksiköt->kuva "m" 2 30 "black")(square 10 0 "transparent")
        (yksiköt->kuva "cm" 3 36 "blue")(square 10 0 "transparent")
        (yksiköt->kuva "mm" 3 20 "red"))