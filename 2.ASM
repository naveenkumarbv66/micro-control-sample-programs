

CODE SEGMENT
ASSUME CS:CODE

START:

      INCLUDE C:\MASM2\21.ASM
      INCLUDE C:\MASM2\22.ASM

      PRINT M1
      LEA SI,STR

NEXT1:
      READ

      MOV [SI],AL
      INC SI
      CMP AL,0DH
      JNE NEXT1

      PRINT M2

      MOV CX,SI
      DEC CX

      LEA SI,STR

LOOP2:
      MOV DL,[SI]
      DISPLAY
      INC SI

      LOOP LOOP2

      MOV AH,4CH
      INT 21H

      CODE ENDS
      END START



