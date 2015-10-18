;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ympyrälieriön_levityskuva_malliratkaisuja) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; piirtää ympyrälieriön levityskuvan
;; ympyrälieriön-levityskuva : Luku Luku -> Kuva
(define (ympyrälieriön-levityskuva r h)
   (above (circle r "outline" "black")
                     (rectangle (* 2 pi r) h "outline" "black")
                     (circle r "outline" "black")))

(check-expect (ympyrälieriön-levityskuva 50 100)
              (above (circle 50 "outline" "black")
                     (rectangle (* 2 pi 50) 100 "outline" "black")
                     (circle 50 "outline" "black")))

;; esimerkkikuva:
(beside (ympyrälieriön-levityskuva 50 100) (square 10 0 "red")
        (ympyrälieriön-levityskuva 25 80))