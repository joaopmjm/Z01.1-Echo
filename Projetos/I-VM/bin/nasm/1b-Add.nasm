; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 0 - Declarando função Main.main
Main.main:
; 1 - PUSH cnt 5
; 2 - PUSH cnt 9
; 3 - ADD
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $SP,%A
subw (%A),$1,%A
addw (%A),%D,%D
movw %D,(%A)
; 4 - POP temp 0
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $5,%A
movw %D,(%A)
; Label (marcador)
Main.Main.main.while:
; 5 - Goto Incondicional
leaw $Main.Main.main.while,%A
jmp
nop
; End
