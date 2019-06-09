; 0 - PUSH constant 0
; 1 - POP temp 0
; 2 - PUSH constant 1
; 3 - POP temp 1
; 4 - PUSH temp 0
; 5 - PUSH constant 10
leaw $SP,%A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
incw %S
leaw $SP, %A
movw %S, (%A)
leaw $EQBasicLoop0, %A
je %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDBasicLoop0, %A
jmp
nop
EQBasicLoop0:
leaw $65535, %A
movw %A, %D
EQ-ENDBasicLoop0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 7 - PUSH temp 0
; 8 - PUSH constant 1
; 9 - ADD
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
; 10 - POP temp 0
; 11 - PUSH temp 1
; 12 - PUSH temp 1
; 13 - ADD
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
; 14 - POP temp 1
; End
