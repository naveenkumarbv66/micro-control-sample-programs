DATA SEGMENT
 N DB 5
 R DB 3
 NCR DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA

START:
      MOV AX,DATA
      MOV DS,AX

      MOV AL,N
      MOV BL,R
      MOV NCR,00H

      CALL NCRP

      MOV AH,4CH
      INT 21H

NCRP PROC
     CMP BL,00H
     JE RES

     CMP AL,BL
     JE RES

     CMP BL,01H
     JE RES1

     DEC AL

     CMP AL,BL
     JE RES2

     PUSH AX
     PUSH BX

     CALL NCRP

     POP BX
     POP AX

     DEC BL

     PUSH AX
     PUSH BX

     CALL NCRP

     POP BX
     POP AX

     RET
RES:
     INC NCR
     RET
RES2:
     INC NCR

RES1:
      ADD NCR,AL
      RET

NCRP ENDP

   CODE ENDS
   END START

