; 0 - POP local 0
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $LCL, %A
movw (%A), %A
movw %A, %D
leaw $0, %A
addw %A, %D, %A
movw %S, (%A)
; 1 - POP local 1
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $LCL, %A
movw (%A), %A
movw %A, %D
leaw $1, %A
addw %A, %D, %A
movw %S, (%A)
; 2 - POP local 2
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw %S, %A
movw (%A), %S
leaw $LCL, %A
movw (%A), %A
movw %A, %D
leaw $2, %A
addw %A, %D, %A
movw %S, (%A)
; End
