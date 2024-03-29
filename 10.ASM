PRINT MACRO TEMP
  LEA DX,TEMP
  MOV AH,09H
  INT 21H
ENDM

DATA SEGMENT
 STR DB 'NAVEEN KUMAR BV$'
 TOTAL DB $-STR
 SSTR DB 'KBV'
 M1 DB 0AH,0DH,'SUB STRING IS FOUND IN MAIN STRING...$'
 M2 DB 0AH,0DH,'SUB STRING IS NOT FOUND IN MAIN STRING...$'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA

START:
      MOV AX,DATA
      MOV DS,AX
      MOV ES,AX

      LEA SI,STR
      MOV CL,TOTAL

L2:
      LEA DI,SSTR

L1:
      MOV AL,[SI]
      INC SI

      MOV AH,[DI]
      DEC CL

      CMP AL,AH
      JNE NEXT

      INC DI

      CMP DI,OFFSET M1
      JE FOUND

      JMP L1

NEXT:
      CMP CL,0H
      JNE L2

      JMP NOTFD

FOUND:
       PRINT M1
       JMP STOP

NOTFD:
       PRINT M2

STOP:
      MOV AH,4CH
      INT 21H

      CODE ENDS
      END START
