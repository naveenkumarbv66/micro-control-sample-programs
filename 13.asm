CODE SEGMENT
ASSUME CS:CODE

START:
      MOV CX,50D
      MOV BL,00

LOOP1:
      MOV AL,BL
      AAM
      ADD AX,3030H

      MOV DL,AH
      PUSH AX

      MOV AH,02H
      INT 21H

      POP AX

      MOV DL,AL
      MOV AH,02H
      INT 21H

      MOV DL,00H
      MOV AH,02H
      INT 21H

      CALL DELAY

      INC BL
      LOOP LOOP1

      MOV AH,4CH
      INT 21H

DELAY PROC NEAR

      MOV SI,02202H
   L2:
      MOV DI,0FFFFH

   L1:
      DEC DI
      JNZ L1

      DEC SI
      JNZ L2
      RET
DELAY ENDP

    CODE ENDS
    END START
