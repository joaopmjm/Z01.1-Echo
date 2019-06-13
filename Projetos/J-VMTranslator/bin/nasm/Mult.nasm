; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 0
leaw $0,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
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
; 3 - PUSH argument 1
leaw $ARG, %A
movw (%A), %D
leaw $1 ,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 4 - POP local 1
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $LCL, %A
movw (%A), %A
movw %A, %D
leaw $1, %A
addw %A, %D, %A
movw %S, (%A)
; 5 - PUSH constant 0
leaw $0,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 6 - PUSH local 1
leaw $LCL, %A
movw (%A), %D
leaw $1 ,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
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
; 8 - PUSH local 0
leaw $LCL, %A
movw (%A), %D
leaw $0 ,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 9 - PUSH argument 0
leaw $ARG, %A
movw (%A), %D
leaw $0 ,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
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
; 11 - POP local 0
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
; 12 - PUSH local 1
leaw $LCL, %A
movw (%A), %D
leaw $1 ,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 13 - PUSH constant 1
leaw $1,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 14 - SUB
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
; 15 - POP local 1
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $LCL, %A
movw (%A), %A
movw %A, %D
leaw $1, %A
addw %A, %D, %A
movw %S, (%A)
; 17 - PUSH local 0
leaw $LCL, %A
movw (%A), %D
leaw $0 ,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 20 - PUSH constant 7
leaw $7,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 21 - PUSH constant 2
leaw $2,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
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
; 23 - PUSH constant 3
leaw $3,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; End
