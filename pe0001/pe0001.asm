; Multiples of 3 or 5
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;
; Find the sum of all the multiples of 3 or 5 below 1000.

.ZEROPAGE
tmp: .res 1
tmp2: .res 1
tmp3: .res 1
tmpl: .res 1
tmph: .res 1

.DATA
Sum: .res 1
Message: .asciiz "Hello World"

.CODE
clc
cld

lda #1
adc #2
sta Sum

lda #<Message
sta tmpl
lda #>Message
sta tmph

ldy #0
Print_Next:
lda (tmpl),y
cmp #0
beq Print_End

clc
adc #128
jsr $FDF0
iny
jmp Print_Next

Print_End:
rts