; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 1
; 2 - PUSH constant 2
; 6 - PUSH argument 0
; 7 - PUSH argument 1
; 8 - ADD
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
