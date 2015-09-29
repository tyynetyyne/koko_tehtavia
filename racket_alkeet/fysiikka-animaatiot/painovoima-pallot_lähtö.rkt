;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname painovoima-pallot_lähtö) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)
(define KORKEUS 500)
(define LEVEYS 300)
(define 1M 10)    ; mittakaava 10px = 1m  
(define ASTEIKKO (rectangle LEVEYS (* 10 1M) "outline" "black"))
(define 50M-ASTEIKKO (above ASTEIKKO ASTEIKKO ASTEIKKO ASTEIKKO ASTEIKKO))
(define TAUSTA (overlay 50M-ASTEIKKO (empty-scene LEVEYS KORKEUS)))
(define PALLO-KUUSSA (circle 30 "solid" "red"))
(define PALLO-KUUSSA-X 100)
(define PALLO-MAASSA (circle 30 "solid" "blue"))
(define PALLO-MAASSA-X 200)
(define g-maa 0)   ; (m/s/s)
(define g-kuu 0)   ; (m/s/s)

; matka-kuussa : luku merkkijono -> luku (tai merkkijono)
; palauttaa matkan metreissä
; - t on aika sekunneissa
(check-expect (matka-kuussa ..)(..))              

(define (matka-kuussa t)
  0)

; matka-kuussa : luku merkkijono -> luku (tai merkkijono)
; palauttaa matkan metreissä
; - t on aika sekunneissa
(check-expect (matka-maassa ..)(..))

(define (matka-maassa t)
  0)

(define (päivitä-kuva t)
  (place-image PALLO-MAASSA PALLO-MAASSA-X (* 10 (matka-maassa t))
               (place-image PALLO-KUUSSA PALLO-KUUSSA-X (* 10 (matka-kuussa t)) TAUSTA)))

(define (päivitä-aika t)
  (+ t (/ 1 28)))

(big-bang 0
          (to-draw päivitä-kuva)
          (on-tick päivitä-aika))