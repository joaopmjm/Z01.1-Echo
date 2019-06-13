; 0 - POP that 0
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw (%A), %A
movw (%A), %S
leaw $0, %A
movw %A,%D
leaw $THAT,%A
movw (%A),%A
addw %A, %D, %A
movw %S, (%A)
; 1 - POP that 1
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw (%A), %A
movw (%A), %S
leaw $1, %A
movw %A,%D
leaw $THAT,%A
movw (%A),%A
addw %A, %D, %A
movw %S, (%A)
; 2 - POP that 2
leaw $SP,%A
movw (%A), %S
decw %S
movw %S, (%A)
movw (%A), %A
movw (%A), %S
leaw $2, %A
movw %A,%D
leaw $THAT,%A
movw (%A),%A
addw %A, %D, %A
movw %S, (%A)
; End
