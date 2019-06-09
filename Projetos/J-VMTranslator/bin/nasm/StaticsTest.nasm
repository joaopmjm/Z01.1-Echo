; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 6
; 2 - PUSH constant 8
; 4 - POP temp 0
; 5 - PUSH constant 23
; 6 - PUSH constant 15
; 8 - POP temp 0
; 13 - PUSH argument 0
; 14 - POP static 0
; 15 - PUSH argument 1
; 16 - POP static 1
; 17 - PUSH constant 0
; 20 - PUSH static 0
; 21 - PUSH static 1
; 22 - SUB
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
; 25 - PUSH argument 0
; 26 - POP static 0
; 27 - PUSH argument 1
; 28 - POP static 1
; 29 - PUSH constant 0
; 32 - PUSH static 0
; 33 - PUSH static 1
; 34 - SUB
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
; End
