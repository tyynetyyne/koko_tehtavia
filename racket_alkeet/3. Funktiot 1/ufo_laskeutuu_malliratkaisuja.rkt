;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ufo_laskeutuu_malliratkaisuja) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define UFO (overlay/xy (ellipse 120 40 "solid" "violet")
                        30 -25
                        (circle 30 "outline" "black")))

(define TAUSTA (empty-scene 300 500))

;; piirrä-ufo : Luku -> Kuva
(define (piirrä-ufo y)
  (place-image UFO 150 y TAUSTA))


(check-expect (piirrä-ufo 20)
              (place-image UFO 150 20 TAUSTA))

(check-expect (piirrä-ufo 150)
              (place-image UFO 150 150 TAUSTA))

(check-expect (piirrä-ufo 300)
              (place-image UFO 150 300 TAUSTA))

;; esimerkkikuva
(beside (piirrä-ufo 20)(square 10 0 "transparent")
        (piirrä-ufo 150)(square 10 0 "transparent")
        (piirrä-ufo 300))