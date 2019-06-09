; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH argument 0
; 2 - PUSH argument 1
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
; 6 - PUSH constant 1
; 7 - PUSH constant 2
; End
