; Multiples of 3 or 5
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;
; Find the sum of all the multiples of 3 or 5 below 1000.

COUT = $FDED
CROUT = $FD8E
PRBLNK = $F948
PRBYTE = $FDDA


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
jsr COUT
iny
jmp Print_Next

Print_End:
jsr CROUT

NUM_LOOPS = 990 / 15                    ; 66
BASE_SUM = 3 + 6 + 9 + 12 + 15 + 5 + 10 ; 60
INC_SUM = 7 * 15                        ; 105

lda #<NUM_LOOPS
jsr PRBYTE
jsr PRBLNK

lda #<BASE_SUM
jsr PRBYTE
jsr PRBLNK

lda #<INC_SUM
jsr PRBYTE
jsr CROUT

lda #0
sta tmp
sta tmp2
sta tmp3
ldy #<NUM_LOOPS

START_ADDING:
lda tmp
clc
adc #<BASE_SUM
sta tmp

bcc NO_CARRY
lda tmp2
clc
adc #1
sta tmp2
bcc NO_CARRY
inc tmp3

NO_CARRY:
sty tmpl
ldx tmpl

START_ADDING_INNER:
dex
beq DONE_INNER

lda tmp
clc
adc #<INC_SUM
sta tmp

bcc NO_CARRY_INNER
lda tmp2
clc
adc #1
sta tmp2
bcc NO_CARRY_INNER
inc tmp3

NO_CARRY_INNER:
jmp START_ADDING_INNER

DONE_INNER:
dey
bne START_ADDING

lda tmp3
jsr PRBYTE
jsr CROUT

lda tmp2
jsr PRBYTE
jsr CROUT

lda tmp
jsr PRBYTE
jsr CROUT

; convert the above hex to decimal, then add 993, 996, 999, and 995.

rts