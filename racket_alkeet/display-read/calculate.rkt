;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname calculate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require teachpacks/display-read)

(define Q1 "Give the widht in cm")
(define Q2 "Give the height in cm")
(define A "Area is: ")
(define CM2 "cm^2")
(define IMG1 (rectangle 200 150 "outline" "blue"))

; area : Number Number -> Number or String
(define (area a b)
  (if  (and (number? a)(number? b))
       (* a b)
       "Error: not numbers"))

; answer : Number or String -> Image
(define (answer input)
  (cond [(number? input)
         (text-and-image (string-append A (number->string input) CM2) IMG1)]
        [(string? input)
         (text-and-image input empty-image)]
        [else
         (text-and-image "ERROR" empty-image)]))
         
; text-and-image : String Image -> Image
(define (text-and-image txt img)
  (above img (text txt 36 "red")))

(display-no-read (answer (area (string->number (display-read (text-and-image Q1 IMG1)))
                               (string->number (display-read (text-and-image Q2 IMG1))))))
