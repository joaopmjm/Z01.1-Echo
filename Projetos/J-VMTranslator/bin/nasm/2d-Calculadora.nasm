; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 2 - PUSH constant 3
; 3 - PUSH constant 3
; 5 - POP temp 2
; 8 - PUSH constant 0
; 9 - POP local 0
; 10 - PUSH argument 1
; 11 - POP local 1
; 12 - PUSH constant 0
; 13 - PUSH local 1
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
leaw $EQmult0, %A
je %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDmult0, %A
jmp
nop
EQmult0:
leaw $65535, %A
movw %A, %D
EQ-ENDmult0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 15 - PUSH local 0
; 16 - PUSH argument 0
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
; 18 - POP local 0
; 19 - PUSH local 1
; 20 - PUSH constant 1
; 21 - SUB
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
; 22 - POP local 1
; 24 - PUSH local 0
; End
