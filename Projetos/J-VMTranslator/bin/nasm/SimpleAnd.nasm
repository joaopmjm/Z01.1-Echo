; 0 - AND
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
andw %D, %S, (%A)
; End
