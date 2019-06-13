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
leaw $EQSimpleLt0, %A
jl %D
nop
leaw $0, %A
movw %A, %D
leaw $EQ-ENDSimpleLt0, %A
jmp
nop
EQSimpleLt0:
leaw $65535, %A
movw %A, %D
EQ-ENDSimpleLt0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %D, (%A)
; End
