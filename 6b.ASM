DATA SEGMENT
SDIGIT DB 0C0H,0F9H,0A4H,0B0H,99H,92H,82H,0F8H,80H,90H
NUM DW 00FH
RL DB 12 DUP(?)
TEMP DW ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
       MOV AX,DATA
       MOV DS,AX
       MOV CX,2
       MOV TEMP,CX
 START: LEA SI,RL
        MOV CX,4
 L1:   MOV AL,0FFH
      MOV [SI],AL
      INC SI
      LOOP L1
      ADD SI,4
      MOV AL,80H
      MOV DX,8403H
      OUT DX,AL
      XOR DX,DX
      MOV AX,NUM
      MOV CX,100
      DIV CX
      AAM
      XCHG AX,DX
      AAM
      PUSH AX
      PUSH DX
      CALL TRANS
      DEC SI
      MOV [SI],AL
      CALL DISP
      CALL DELAY
      POP DX
      POP AX
      MOV AL,AH
      PUSH AX
      PUSH DX
      CALL TRANS
      DEC SI
      MOV [SI],AL
      CALL DISP
      CALL DELAY
      POP DX
      POP AX
      MOV AL,DL
      PUSH AX
      PUSH DX
      CALL TRANS
      DEC SI
      MOV [SI],AL
      CALL DISP
      CALL DELAY
      POP DX
      POP AX
      MOV AL,DH
      PUSH AX
      PUSH DX
      CALL TRANS
      DEC SI
      MOV [SI],AL
      CALL DISP
      CALL DELAY
      MOV CX,4
      MOV AL,0FFH
      ADD SI,4
 L2:   CALL DISP
       CALL DELAY
       MOV [SI],AL
       INC SI
       LOOP L2
       MOV SI,OFFSET RL
       ADD SI,4
       MOV DI,0
 L3:   MOV CX,4
 L4:   MOV AL,[SI]
       CALL DISP
       DEC SI
       LOOP L4
       CALL DELAY
       INC DI
       MOV SI,OFFSET RL
       ADD SI,DI
       ADD SI,4
       CMP DI,8
       JNE L3
       MOV CX,TEMP
       DEC CX
       MOV TEMP,CX
       JNZ  FAR PTR
       MOV AH,4CH
       INT 21H
       TRANS PROC NEAR
       MOV BX,OFFSET SDIGIT
       XLAT
       RET
       TRANS ENDP
       DISP PROC NEAR
       PUSH AX
       PUSH BX
       PUSH CX
       PUSH DX
       MOV CX,8
 AGAIN:
        ROL AL,1
        MOV DX,8401H
        OUT DX,AL
        PUSH AX
        MOV AL,0FFH
        MOV DX,8402H
        OUT DX,AL
        MOV AL,00H
        OUT DX,AL
        POP AX
        LOOP AGAIN
        POP DX
        POP CX
        POP BX
        POP AX
        RET
        DISP ENDP
       DELAY PROC NEAR
       PUSH AX
       PUSH DX
       PUSH CX
       MOV DX,0FFFFH
       MOV CX,0FFFH
  L5:
        MOV AX,0FFFFH
 L6:
        DEC AX
        JNZ L6
        LOOP L5
        POP DX
        POP CX
        POP AX
        RET
        DELAY ENDP
        CODE ENDS
        END START


