;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname multiplication_game) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require teachpacks/display-read)

; math-game : String Number Number Number Number -> ""
(define (math-game msg num1 num2 rounds score)
  (if (<= rounds 0)
      (display-no-read (string-append "Your score: " (number->string score)))
      (if (equal? (string->number (display-read (string-append (number->string num1) " * " (number->string num2))))
                  (* num1 num2))
          (math-game (display-no-read "Correct") (random 10) (random 10) (sub1 rounds) (add1 rounds))
          (math-game (display-no-read "Wrong, try again") num1 num2 (sub1 rounds) score)))) 
                    
; game : Number -> ""
(define (game rounds)
  (math-game "" (random 10) (random 10) rounds 0))

; starts the game
(game 10)