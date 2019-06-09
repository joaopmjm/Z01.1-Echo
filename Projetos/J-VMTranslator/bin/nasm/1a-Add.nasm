; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH cnt 123
; 2 - PUSH cnt 23
; 3 - ADD
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
; End
