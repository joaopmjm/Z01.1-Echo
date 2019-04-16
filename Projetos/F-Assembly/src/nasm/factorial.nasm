; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $0, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)
decw %D
decw %D
leaw $2, %A
movw %D, (%A)
movw %D, %S
leaw $main, %A
jg %S
nop
main:	
	leaw $1, %A
	movw (%A), %D
	leaw $loop, %A
	jg %S
	nop
loop:
	leaw $1, %A
	addw %D, (%A), %D
	leaw $loop, %A
	decw %S
	jg %S
	nop
	leaw $1, %A
	movw %D, (%A)
	leaw $2, %A
	movw (%A), %S
	decw %S
	movw %S, (%A)
	leaw $main, %A
	jg %S
	nop
leaw $fact, %A
jg %D
nop
incw %D
fact:
	leaw $1, %A
	movw %D, (%A)

