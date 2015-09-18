;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname guess_my_number) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require teachpacks/display-read)

(define QUESTION "Guess what number I'm thinking")

; text-and-image : String Image -> Image
(define (text-and-image txt img)
  (above img (text txt 36 "red")))

; give-hint
(define (give-hint answer guess)
  (cond [(and (number? guess)(< answer guess))
        (text "smaller" 36 "red")]
        [(and (number? guess)(> answer guess))
         (text "bigger" 36 "red")]
        [else (text "give a number" 36 "red")]))

; guess-my-number : Number Number Number -> ""
(define (guess-my-number computer human rounds)
  (cond [(and (number? human)(= computer human))
         (display-no-read (string-append "CORRECT! Rounds: " (number->string rounds)))]
        [else
         (guess-my-number computer
                          (string->number (display-read (text-and-image QUESTION (give-hint computer human))))
                          (add1 rounds))]))

; start : Number -> ""
(define (start max)
  (guess-my-number (random max)
                   (string->number (display-read (text-and-image QUESTION empty-image)))
                   0))

; start the game
(start 40)
