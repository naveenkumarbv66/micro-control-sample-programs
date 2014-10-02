data segment
msg db 0ah,0dh, "PRESS ANY KEY TO EXIT: $"
floor db 00h,03h,06h,09h,0e0h,0d3h,0b6h,79h
data ends

code segment
assume cs:code, ds:data
start:  mov ax,data
        mov ds,ax
        mov dx,0c803h
        mov al,82h
        out dx,al
        mov ah,9
        lea dx,msg
        int 21h
        mov bl,0
loop1: mov al,bl
       or al,0f0h
       mov dx,0c800h
       out dx,al
       lea si,floor
loop2:  call kbhit
        mov dx,0c801h
        in al,dx
        or al,0f0h
        mov cl,al
        sub al,0ffh
        jz loop2
loop3:  mov al,cl
        ror al,1
        mov cl,al
        jnc decide
        inc si
        jmp loop3
decide : call delay
        mov al,[si]
        sub al,bl
        js down
        jz reset
up:     inc bl
        mov al,bl
        or al,0f0h
        mov dx,0c800h
        out dx,al
        jmp decide
down:   dec bl
        mov al,bl
        or al,0f0h
        mov dx,0c800h
        out dx,al
        jmp decide
reset:  add si,4
        mov al,[si]
        mov dx,0c800h
        out dx,al
        jmp loop1
kbhit:  mov al,1
        int 16h
        jnz exit
        ret
exit: mov ah,4ch
       int 21h

delay proc near
        push cx
        push bx
        mov bx,01ffh
b2:     mov cx,0fffh
b1:     loop b1
        dec bx
        jnz b2
        pop bx
        pop cx
        ret

      delay endp
      code ends
      end start
        
