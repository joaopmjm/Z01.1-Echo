; 0 - PUSH constant 111
; 1 - PUSH constant 333
; 2 - PUSH constant 888
; 3 - POP static 8
; 4 - POP static 3
; 5 - POP static 1
; 6 - PUSH static 3
; 7 - PUSH static 1
; 8 - SUB
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
; 9 - PUSH static 8
; 10 - ADD
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
