; 0 - PUSH constant 17
leaw $17,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 1 - PUSH constant 17
leaw $17,%A
movw %A,%D
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
leaw $EQStackTest0, %A
je %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDStackTest0, %A
jmp
nop
EQStackTest0:
leaw $65535, %A
movw %A, %D
EQ-ENDStackTest0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 2 - PUSH constant 17
leaw $17,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 3 - PUSH constant 16
leaw $16,%A
movw %A,%D
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
leaw $EQStackTest1, %A
je %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDStackTest1, %A
jmp
nop
EQStackTest1:
leaw $65535, %A
movw %A, %D
EQ-ENDStackTest1:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 4 - PUSH constant 16
leaw $16,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 5 - PUSH constant 17
leaw $17,%A
movw %A,%D
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
leaw $EQStackTest2, %A
je %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDStackTest2, %A
jmp
nop
EQStackTest2:
leaw $65535, %A
movw %A, %D
EQ-ENDStackTest2:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 6 - PUSH constant 892
leaw $892,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 7 - PUSH constant 891
leaw $891,%A
movw %A,%D
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
leaw $EQStackTest0, %A
jl %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDStackTest0, %A
jmp
nop
EQStackTest0:
leaw $65535, %A
movw %A, %D
EQ-ENDStackTest0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 8 - PUSH constant 891
leaw $891,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 9 - PUSH constant 892
leaw $892,%A
movw %A,%D
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
leaw $EQStackTest1, %A
jl %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDStackTest1, %A
jmp
nop
EQStackTest1:
leaw $65535, %A
movw %A, %D
EQ-ENDStackTest1:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 10 - PUSH constant 891
leaw $891,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 11 - PUSH constant 891
leaw $891,%A
movw %A,%D
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
leaw $EQStackTest2, %A
jl %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDStackTest2, %A
jmp
nop
EQStackTest2:
leaw $65535, %A
movw %A, %D
EQ-ENDStackTest2:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 12 - PUSH constant 32767
leaw $32767,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 13 - PUSH constant 32766
leaw $32766,%A
movw %A,%D
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
leaw $EQStackTest0, %A
jg %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDStackTest0, %A
jmp
nop
EQStackTest0:
leaw $65535, %A
movw %A, %D
EQ-ENDStackTest0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 14 - PUSH constant 32766
leaw $32766,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 15 - PUSH constant 32767
leaw $32767,%A
movw %A,%D
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
leaw $EQStackTest1, %A
jg %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDStackTest1, %A
jmp
nop
EQStackTest1:
leaw $65535, %A
movw %A, %D
EQ-ENDStackTest1:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 16 - PUSH constant 32766
leaw $32766,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 17 - PUSH constant 32766
leaw $32766,%A
movw %A,%D
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
leaw $EQStackTest2, %A
jg %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDStackTest2, %A
jmp
nop
EQStackTest2:
leaw $65535, %A
movw %A, %D
EQ-ENDStackTest2:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 18 - PUSH constant 57
leaw $57,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 19 - PUSH constant 31
leaw $31,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 20 - PUSH constant 53
leaw $53,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 21 - ADD
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
; 22 - PUSH constant 112
leaw $112,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
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
; 24 - NEG
leaw $SP, %A
subw (%A), $1, %A
movw (%A), %D
negw %D
movw %D, (%A)
; 25 - AND
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
andw %S, %D, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 26 - PUSH constant 82
leaw $82,%A
movw %A,%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 27 - OR
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
orw %S, %D, %D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 28 - NOT
leaw $SP, %A
subw (%A), $1, %A
movw (%A), %d
notw %D
movw %D, (%A)
; End
