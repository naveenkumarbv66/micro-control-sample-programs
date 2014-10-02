data segment
n1 db 86h,88h,0f9h,8eh
n2 db 8ch,0c7h,86h,89h
data ends
code segment
assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        mov dx,0c803h
        mov al,80h
        out dx,al
        mov cx,04h
again:lea si,n1
       push cx
       call display
       call delay
       lea si,n2
       call display
       call delay
       pop cx
       loop again
       mov ah,4ch
       int 21h
        display proc near
        push ax
        push bx
        push cx
        push dx
        mov cx,04h
loop2:mov bl,08h
       mov al,[si]
loop3:mov dx,0c801h
       rol al,01h
       out dx,al
       mov bh,al
       mov dx,0c802h
       mov al,0ffh
       out dx,al
       mov al,00h
       out dx,al
       dec bl
       jz down1
       mov al,bh
       jmp loop3
down1:inc si
      loop loop2
      pop dx
      pop cx
      pop bx
      pop ax
      ret
      display endp
      delay proc near
      push ax
      push cx
      push dx
      mov cx,0Ffffh
      mov dx,0fffh
l5:mov ax,0ffffh
l4:dec ax
   jnz l4
   loop l5
   pop dx
   pop cx
   pop ax
   ret
   delay endp
   code ends
   end start
