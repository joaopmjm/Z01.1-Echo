; 0 - ADD
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
