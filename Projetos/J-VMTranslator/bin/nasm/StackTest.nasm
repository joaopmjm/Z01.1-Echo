; 0 - PUSH constant 17
; 1 - PUSH constant 17
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
; 3 - PUSH constant 16
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
; 5 - PUSH constant 17
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
; 7 - PUSH constant 891
; 8 - LT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
leaw $LTStackTest0, %A
jlt %D
nop
leaw $0, %A
movw %A, %D
leaw $LT-ENDStackTest0, %A
jmp
nop
LTStackTest0:
leaw $65535, %A
movw %A, %D
LT-ENDStackTest0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, (%A)
; 9 - PUSH constant 891
; 10 - PUSH constant 892
; 11 - LT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
leaw $LTStackTest1, %A
jlt %D
nop
leaw $0, %A
movw %A, %D
leaw $LT-ENDStackTest1, %A
jmp
nop
LTStackTest1:
leaw $65535, %A
movw %A, %D
LT-ENDStackTest1:
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, (%A)
; 12 - PUSH constant 891
; 13 - PUSH constant 891
; 14 - LT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
leaw $LTStackTest2, %A
jlt %D
nop
leaw $0, %A
movw %A, %D
leaw $LT-ENDStackTest2, %A
jmp
nop
LTStackTest2:
leaw $65535, %A
movw %A, %D
LT-ENDStackTest2:
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, (%A)
; 15 - PUSH constant 32767
; 16 - PUSH constant 32766
; 17 - GT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
leaw $GTStackTest0, %A
jgt %D
nop
leaw $0, %A
movw %A, %D
leaw $GT-ENDStackTest0, %A
jmp
nop
GTStackTest0:
leaw $65535, %A
movw %A, %D
GT-ENDStackTest0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, (%A)
; 18 - PUSH constant 32766
; 19 - PUSH constant 32767
; 20 - GT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
leaw $GTStackTest1, %A
jgt %D
nop
leaw $0, %A
movw %A, %D
leaw $GT-ENDStackTest1, %A
jmp
nop
GTStackTest1:
leaw $65535, %A
movw %A, %D
GT-ENDStackTest1:
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, (%A)
; 21 - PUSH constant 32766
; 22 - PUSH constant 32766
; 23 - GT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
leaw $GTStackTest2, %A
jgt %D
nop
leaw $0, %A
movw %A, %D
leaw $GT-ENDStackTest2, %A
jmp
nop
GTStackTest2:
leaw $65535, %A
movw %A, %D
GT-ENDStackTest2:
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, (%A)
; 24 - PUSH constant 57
; 25 - PUSH constant 31
; 26 - PUSH constant 53
; 27 - ADD
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
; 28 - PUSH constant 112
; 29 - SUB
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
; 30 - NEG
leaw $SP, %A
subw (%A), $1, %A
movw (%A), %D
negw %D
movw %D, (%A)
; 31 - AND
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
andw %D, %S, (%A)
; 32 - PUSH constant 82
; 33 - OR
leaw $SP, %A
movw (%A), %S
subw %S, $2, %S
movw %S, %A
movw (%A), %d
incw %S
movw %S, %A
orw (%A), %D, %D
movw %D, (%A)
; 34 - NOT
leaw $SP, %A
subw (%A), $1, %A
movw (%A), %d
notw %D
movw %D, (%A)
; End
