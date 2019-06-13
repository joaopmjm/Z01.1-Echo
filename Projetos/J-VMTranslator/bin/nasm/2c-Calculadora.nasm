; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 15
; 2 - PUSH constant 5
; 4 - POP temp 1
leaw $SP, %A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $6, %A
movw %S, (%A)
; End
