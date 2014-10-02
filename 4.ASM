DATA SEGMENT
  M1 DB 0AH,0DH,'ENTER SINGL CHARECTER : $'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA

START:
      MOV AX,DATA
      MOV DS,AX

      MOV AH,07
      MOV AL,00H
      MOV BH,0F
      MOV BL,00H
      MOV DH,24
      MOV DL,79H
      INT 10H

      MOV AH,02
      MOV AL,00H
      MOV BX,0000H
      MOV DX,0000H
      INT 10H

      LEA DX,M1
      MOV AH,09H
      INT 21H

      MOV AH,01H
      INT 21H

      PUSH AX

      MOV AH,02
      MOV AL,00H
      MOV BX,0000H
      MOV DH,20H
      MOV DL,15H
      INT 10H

      POP AX

      MOV BL,AL

      AND AL,0F0H
      MOV CL,04H
      ROR AL,CL

      CMP AL,0AH
      JL NEXT1
      ADD AL,07H

NEXT1:
      ADD AL,30H
      MOV DL,AL
      MOV AH,02H
      INT 21H

      MOV DL,BL
      AND DL,0FH

      CMP DL,0AH
      JL NEXT2
      ADD DL,07H

NEXT2:
      ADD DL,30H
      MOV AH,02H
      INT 21H

      MOV AH,4CH
      INT 21H

      CODE ENDS
      END START
