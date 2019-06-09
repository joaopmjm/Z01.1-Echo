; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 3 - PUSH constant 0
; 4 - POP local 0
; 5 - PUSH argument 1
; 6 - POP local 1
; 7 - PUSH constant 0
; 8 - PUSH local 1
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
; 10 - PUSH local 0
; 11 - PUSH argument 0
; 12 - ADD
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
; 13 - POP local 0
; 14 - PUSH local 1
; 15 - PUSH constant 1
; 16 - SUB
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
; 17 - POP local 1
; 19 - PUSH local 0
; End
