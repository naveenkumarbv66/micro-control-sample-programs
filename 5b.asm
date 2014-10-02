data segment
n1 db 86h,88h,0f9h,8eh,0ffh,0ffh,0ffh,0ffh,8ch,0c7h,86h,89h
data ends

code segment
assume cs:code,ds:data
 start:mov ax,data
       mov ds,ax
       mov dx,0c803h
       mov al,80h
       out dx,al
       mov cx,2
 again: mov bx,12
        lea si,n1
        push cx
 l1:    CALL DISP
        CALL DELAY
        INC SI
        DEC BX
        JNZ L1
        POP CX
        LOOP AGAIN
        MOV AH,4CH
        INT 21H
        DISP PROC NEAR
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        MOV BL,08H
        MOV AL,[SI]
   L2:  ROL AL,01
        MOV DX,0C801H
        OUT DX,AL
        PUSH AX
        MOV AL,0FFH
        MOV DX,0C802H
        OUT DX,AL
        MOV AL,00H
        OUT DX,AL
        DEC BL
        POP AX
        JZ L3
        JMP L2
  L3:   POP DX
        POP CX
        POP BX
        POP AX
        RET
        DISP ENDP
        DELAY PROC NEAR
        PUSH AX
        PUSH BX
        PUSH DX
        PUSH CX
        MOV DX,0FFFFH
        MOV CX,0FFFH
  L5:   MOV AX,0FFFFH
  L4:   DEC AX
        JNZ L4
        LOOP L5
        POP DX
        POP CX
        POP BX
        POP AX
        RET
        DELAY ENDP
        CODE ENDS
        END START

 
