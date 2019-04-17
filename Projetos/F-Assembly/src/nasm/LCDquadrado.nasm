; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD
;  - Valide no hardawre
;  - Bata uma foto!



  leaw $0, %A
  movw %A, %S
  notw %S


  leaw $18404, %A
  movw %S, (%A)

  leaw $18424, %A
  movw %S, (%A)

  leaw $18444, %A
  movw %S, (%A)

  leaw $18464, %A
  movw %S, (%A)

  leaw $18484, %A
  movw %S, (%A)

  leaw $18504, %A
  movw %S, (%A)

  leaw $18524, %A
  movw %S, (%A)

  leaw $18544, %A
  movw %S, (%A)

  leaw $18564, %A
  movw %S, (%A)

  leaw $18584, %A
  movw %S, (%A)

  leaw $18604, %A
  movw %S, (%A)

  leaw $18624, %A
  movw %S, (%A)


  ; codigo do line

  
  leaw $9815, %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)
  incw %A
  movw %S, (%A)