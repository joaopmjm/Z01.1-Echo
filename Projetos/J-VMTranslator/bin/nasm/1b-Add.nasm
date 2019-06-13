; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH cnt 5
; 2 - PUSH cnt 9
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
; 4 - POP temp 0
leaw $SP, %A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $5, %A
movw %S, (%A)
; End
