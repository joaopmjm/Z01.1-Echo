; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
;  Encontra o resto da divisão entre RAM[0] e RAM[1] e o salva em RAM[2].

leaw $R1,%A ; aponta A para R1
movw (%A), %S ; aponta A para R1
loop: ; marcador
leaw $R2, %A;utilizamos R2 apenas dentro do loop, pois ele e utilizado a cada iteracao
subw %S, (%A), %S ; subtrai os valores de ram1 pela ram2, de maneira a efetuar uma divisao mecanica
leaw $loop, %A  
jge %S ; quebra o loop quando o valor no registrador S deixar de ser maior ou igual a zero
nop
leaw $R2, %A
addw (%A),%S,%S ; coloca no ram2 o valor de S 
leaw R2, %A
leaw $R0, %A
movw %S,(%A)
