; 0 - PUSH local 0
leaw $LCL, %A
movw (%A), %D
leaw $0 ,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 1 - PUSH local 1
leaw $LCL, %A
movw (%A), %D
leaw $1 ,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; 2 - PUSH local 2
leaw $LCL, %A
movw (%A), %D
leaw $2 ,%A
addw %A,%D,%A
movw (%A),%D
leaw $SP, %A
movw (%A), %A
movw %D,(%A)
addw %A,$1,%S
leaw $SP, %A
movw %S,(%A)
; End
