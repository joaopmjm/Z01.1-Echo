; 0 - PUSH constant 5
; 2 - PUSH constant 3
; 3 - POP temp 0
leaw $SP, %A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $5, %A
movw %S, (%A)
; End
