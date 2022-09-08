; Multiples of 3 or 5
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;
; Find the sum of all the multiples of 3 or 5 below 1000.

.DATA
Sum: .res 1
.asciiz "Hello"

.CODE
CLC
CLD

LDA #01
ADC #02 
STA Sum

RTS