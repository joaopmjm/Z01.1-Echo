; 0 - PUSH constant 10
; 1 - PUSH local 0
; 2 - POP local 0
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $LCL, %A
movw (%A), %A
movw %A, %D
leaw $0, %A
addw %A, %D, %A
movw %S, (%A)
; 3 - PUSH constant 21
; 4 - PUSH constant 22
; 5 - POP argument 2
; 6 - POP argument 1
; 7 - PUSH constant 36
; 8 - POP this 6
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw (%A), %A
movw (%A), %S
leaw $6, %A
movw %A,%D
leaw $THIS,%A
movw (%A),%A
addw %A, %D, %A
movw %S, (%A)
; 9 - PUSH constant 42
; 10 - PUSH constant 45
; 11 - POP that 5
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw (%A), %A
movw (%A), %S
leaw $5, %A
movw %A,%D
leaw $THAT,%A
movw (%A),%A
addw %A, %D, %A
movw %S, (%A)
; 12 - POP that 2
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw (%A), %A
movw (%A), %S
leaw $2, %A
movw %A,%D
leaw $THAT,%A
movw (%A),%A
addw %A, %D, %A
movw %S, (%A)
; 13 - PUSH constant 510
; 14 - POP temp 6
leaw $SP, %A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $11, %A
movw %S, (%A)
; 15 - PUSH local 0
; 16 - PUSH that 5
; 17 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
addw %S, %D, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 18 - PUSH argument 1
; 19 - SUB
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 20 - PUSH this 6
leaw $6, %A
movw %A,%D
leaw $THIS,%A
movw (%A),%A
addw %A, %D, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
leaw $SP,%A
movw (%A),%S
incw %S
movw %S, (%A)
; 21 - PUSH this 6
leaw $6, %A
movw %A,%D
leaw $THIS,%A
movw (%A),%A
addw %A, %D, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
leaw $SP,%A
movw (%A),%S
incw %S
movw %S, (%A)
; 22 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
addw %S, %D, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 23 - SUB
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 24 - PUSH temp 6
; 25 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
addw %S, %D, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; End
