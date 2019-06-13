; 0 - OR
leaw $SP, %A
movw (%A), %S
subw %S, $2, %S
movw %S, %A
movw (%A), %d
incw %S
movw %S, %A
orw (%A), %D, %D
movw %D, (%A)
; End
