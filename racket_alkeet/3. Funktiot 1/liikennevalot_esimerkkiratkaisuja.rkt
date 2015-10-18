;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname liikennevalot_esimerkkiratkaisuja) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Liikennevalot, kun valojen värit on annettu ylhäältä alas
;; liikennevalot : Väri Väri Väri -> Kuva

(define (liikennevalot p k v)
  (overlay (above (circle 20 "solid" p)
                  (circle 20 "solid" k)
                  (circle 20 "solid" v))
           (rectangle 60 140 "solid" "black")))

(check-expect (liikennevalot "red" "black" "black")
              (overlay (above (circle 20 "solid" "red")
                              (circle 20 "solid" "black")
                              (circle 20 "solid" "black"))
                       (rectangle 60 140 "solid" "black")))

;; esimerkkikuva:
(beside (liikennevalot "red" "black" "black")(square 10 0 "transparent")
        (liikennevalot "black" "yellow" "black")(square 10 0 "transparent")
        (liikennevalot "black" "black" "green"))

;; Liikennevalot, kun annetaan valon väri sekä luku (i), joka kuvaa monesko väri on kyseessä (ensimmäinen: 0, keskimmäinen: 1, alin: 2)
;; liikennevalot2 : Luku Väri -> Kuva

(define (liikennevalot2 i väri)
 (overlay/xy (circle 20 "solid" väri)
                          -10 (+ (* i -40) -10)
                          (rectangle 60 140 "solid" "black")))

(check-expect (liikennevalot2 0 "red")
              (overlay/xy (circle 20 "solid" "red")
                          -10 -10
                          (rectangle 60 140 "solid" "black")))
              
(check-expect (liikennevalot2 1 "yellow")
              (overlay/xy (circle 20 "solid" "yellow")
                          -10 (+ (* 1 -40) -10)
                          (rectangle 60 140 "solid" "black")))

;; esimerkkikuva:
(beside (liikennevalot2 0 "red")(square 10 0 "transparent")
        (liikennevalot2 1 "yellow")(square 10 0 "transparent")
        (liikennevalot2 2 "green"))
