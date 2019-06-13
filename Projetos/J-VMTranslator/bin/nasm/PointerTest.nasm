; 0 - PUSH constant 3030
; 1 - POP pointer 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
leaw $THIS, %A
movw %S, (%A)
; 2 - PUSH constant 3040
; 3 - POP pointer 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
leaw $THAT, %A
movw %S, (%A)
; 4 - PUSH constant 32
; 5 - POP this 2
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw (%A), %A
movw (%A), %S
leaw $2, %A
movw %A,%D
leaw $THIS,%A
movw (%A),%A
addw %A, %D, %A
movw %S, (%A)
; 6 - PUSH constant 46
; 7 - POP that 6
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw (%A), %A
movw (%A), %S
leaw $6, %A
movw %A,%D
leaw $THAT,%A
movw (%A),%A
addw %A, %D, %A
movw %S, (%A)
; 8 - PUSH pointer 0
; 9 - PUSH pointer 1
; 10 - ADD
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
; 11 - PUSH this 2
leaw $2, %A
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
; 12 - SUB
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
; 13 - PUSH that 6
; 14 - ADD
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
