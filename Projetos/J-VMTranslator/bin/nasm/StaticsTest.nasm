; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH argument 0
; 2 - POP static 0
; 3 - PUSH argument 1
; 4 - POP static 1
; 5 - PUSH constant 0
; 8 - PUSH static 0
; 9 - PUSH static 1
; 10 - SUB
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
; 13 - PUSH constant 6
; 14 - PUSH constant 8
; 16 - POP temp 0
leaw $SP, %A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $5, %A
movw %S, (%A)
; 17 - PUSH constant 23
; 18 - PUSH constant 15
; 20 - POP temp 0
leaw $SP, %A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $5, %A
movw %S, (%A)
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
