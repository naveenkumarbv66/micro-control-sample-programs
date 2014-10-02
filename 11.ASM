DATA SEGMENT
 STR DB 50
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA

START:
      MOV AX,DATA
      MOV DS,AX

      MOV CX,8
      MOV AL,00H
      MOV BL,01H
      LEA SI,STR

      MOV [SI],AL

      CMP CX,01
      JE RESULT

      INC SI
      DEC CX
      CALL FIB

RESULT:
       MOV AH,4CH
       INT 21H

FIB PROC
        
L1:
     MOV [SI],BL
     MOV BL,[SI]
     MOV AL,[SI-1]
     INC SI
     ADD BL,AL
     LOOP L1
     RET
FIB ENDP
     CODE ENDS
     END START
