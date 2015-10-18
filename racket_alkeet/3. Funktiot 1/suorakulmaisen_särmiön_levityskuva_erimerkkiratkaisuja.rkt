;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname suorakulmaisen_särmiön_levityskuva_erimerkkiratkaisuja) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; piirtää suorakulmaisen särmiön levityskuvan
;; suorakulmaisen-särmiön-levityskuva : Luku Luku Luku -> Kuva
(define (suorakulmaisen-särmiön-levityskuva a b c)
  (above (rectangle a c "outline" "black")
         (rectangle a b "outline" "black")
         (beside (rectangle b c "outline" "black")
                 (rectangle a c "outline" "black")
                 (rectangle b c "outline" "black"))
         (rectangle a b "outline" "black")))

(check-expect (suorakulmaisen-särmiön-levityskuva 120 30 60)
              (above (rectangle 120 60 "outline" "black")
                     (rectangle 120 30 "outline" "black")
                     (beside (rectangle 30 60 "outline" "black")
                             (rectangle 120 60 "outline" "black")
                             (rectangle 30 60 "outline" "black"))
                     (rectangle 120 30 "outline" "black")))

;; esimerkkikuva:
(beside (suorakulmaisen-särmiön-levityskuva 120 30 60) (square 20 0 "transparent")
        (suorakulmaisen-särmiön-levityskuva 60 60 60) (square 20 0 "transparent")
        (suorakulmaisen-särmiön-levityskuva 40 20 60))

