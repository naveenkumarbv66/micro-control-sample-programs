data segment
msg1 db 0ah,0dh,"Press any key to continue $"
msg2 db 0aH,0DH,"PRESS ANY KEY TO SEE BCD UP-DOWN COUNTER $"
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
MOV AX,DATA
MOV DS,AX
LEA DX,MSG1
MOV AH,09H
INT 21H
MOV AH,08H
INT 21H
MOV AL,80H
MOV DX,0C803H
OUT DX,AL

MOV DX,0C800H
MOV AL,1
 MOV CX,08H
L1:     OUT DX,AL
     CALL DELAY
     ROL AL,1
     LOOP L1
    
     LEA DX,MSG2
     MOV AH,09H
     INT 21H
     MOV AH,08H
     INT 21H
     MOV AL,00
     MOV CX,10
     MOV DX,0C800H
L2:   OUT DX,AL
        CALL DELAY
        INC AL
        LOOP L2
        MOV CX,10
L3:     DEC AL
        OUT DX,AL
        CALL DELAY
        LOOP L3
        MOV AH,4CH
        INT 21H
        DELAY PROC NEAR
        PUSH AX
        PUSH CX
        PUSH DX
        MOV CX,0FFFFH
 L5        :     MOV AX,0FFFFH
L4:     DEC AX
        JNZ L4
        LOOP L5
        POP DX
        POP CX
        POP AX
        RET
        DELAY ENDP
        CODE ENDS
        END START



