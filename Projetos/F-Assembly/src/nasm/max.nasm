; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01

; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros

leaw $R0, %A
movw (%A), %S
leaw $R1, %A
subw %S, (%A), %D
leaw $R9, %A
jg %D
nop
leaw $R1, %A
movw (%A), %S
leaw $R2, %A
movw %S, (%A)