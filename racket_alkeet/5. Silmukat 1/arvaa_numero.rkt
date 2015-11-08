;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arvaa_numero) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require teachpacks/display-read)

; anna-vinkki : Luku Luku -> Merkkijono
(define (anna-vinkki oikea arvaus)
  (cond [(and (number? arvaus)(< oikea arvaus))
        "pienempi"]
        [(and (number? arvaus)(> oikea arvaus))
         "suurempi"]
        [else "anna numero"]))

; arvaa-numero : Luku Luku Luku -> Luku
(define (arvaa-numero tietokone ihminen kierrokset)
  (if (and (number? ihminen)(= tietokone ihminen))
      (display-value "Oikein! Kierrokset: " kierrokset)
      (arvaa-numero tietokone
                  (string->number (display-read (anna-vinkki tietokone ihminen)))
                  (add1 kierrokset))))

; arvaa : Luku -> Luku
(define (arvaa max)
  (arvaa-numero (random max)
              (string->number (display-read (string-append "Mitä numeroa ajattelen? " (number->string 0) "-" (number->string max))))
              0))

; aloita peli
(arvaa 40)