; 0 - LT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
leaw $LTSimpleLt0, %A
jlt %D
nop
leaw $0, %A
movw %A, %D
leaw $LT-ENDSimpleLt0, %A
jmp
nop
LTSimpleLt0:
leaw $65535, %A
movw %A, %D
LT-ENDSimpleLt0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, (%A)
; End
