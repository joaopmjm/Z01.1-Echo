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
; 9 - PUSH constant 891
; 10 - PUSH constant 892
; 11 - LT
; 12 - PUSH constant 891
; 13 - PUSH constant 891
; 14 - LT
; 15 - PUSH constant 32767
; 16 - PUSH constant 32766
; 17 - GT
; 18 - PUSH constant 32766
; 19 - PUSH constant 32767
; 20 - GT
; 21 - PUSH constant 32766
; 22 - PUSH constant 32766
; 23 - GT
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
; 32 - PUSH constant 82
; 33 - OR
; 34 - NOT
; End
