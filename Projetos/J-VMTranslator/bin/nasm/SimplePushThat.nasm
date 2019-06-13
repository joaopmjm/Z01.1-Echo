; 0 - PUSH that 0
leaw $0, %A
movw %A,%D
leaw $THAT,%A
movw (%A),%A
addw %A, %D, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
leaw $SP,%A
movw (%A),%S
incw %S
movw %S, (%A)
; 1 - PUSH that 1
leaw $1, %A
movw %A,%D
leaw $THAT,%A
movw (%A),%A
addw %A, %D, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
leaw $SP,%A
movw (%A),%S
incw %S
movw %S, (%A)
; 2 - PUSH that 2
leaw $2, %A
movw %A,%D
leaw $THAT,%A
movw (%A),%A
addw %A, %D, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
leaw $SP,%A
movw (%A),%S
incw %S
movw %S, (%A)
; End
