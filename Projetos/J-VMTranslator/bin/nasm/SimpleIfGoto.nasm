; 0 - PUSH constant 5
; 1 - PUSH constant 15
; 2 - PUSH constant 15
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
leaw $EQSimpleIfGoto0, %A
je %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDSimpleIfGoto0, %A
jmp
nop
EQSimpleIfGoto0:
leaw $65535, %A
movw %A, %D
EQ-ENDSimpleIfGoto0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 4 - PUSH constant 3
; 5 - POP temp 0
; 6 - PUSH constant 15
; 7 - PUSH constant 9
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
leaw $EQSimpleIfGoto1, %A
je %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDSimpleIfGoto1, %A
jmp
nop
EQSimpleIfGoto1:
leaw $65535, %A
movw %A, %D
EQ-ENDSimpleIfGoto1:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; 9 - PUSH constant 2
; 10 - POP temp 1
; End
