; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
;  Encontra o resto da divisão entre RAM[0] e RAM[1] e o salva em RAM[2].

leaw $R1,%A
movw (%A), %D
leaw $R0, %A
movw (%A), %S
decw %S
loop:
leaw $R1, %A
subw (%A), %D, %D
leaw $loop, %A
decw %S
jne %S
nop
leaw R2, %A
movw %D, (%A)