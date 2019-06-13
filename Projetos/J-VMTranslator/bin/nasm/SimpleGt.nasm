; 0 - GT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
leaw $GTSimpleGt0, %A
jgt %D
nop
leaw $0, %A
movw %A, %D
leaw $GT-ENDSimpleGt0, %A
jmp
nop
GTSimpleGt0:
leaw $65535, %A
movw %A, %D
GT-ENDSimpleGt0:
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, (%A)
; End
