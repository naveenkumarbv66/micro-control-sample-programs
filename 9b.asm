data segment
n dw 50h
data ends
code segment
assume cs:code,ds:data
start:mov ax,data
mov ds,ax
mov dx,0c803h
mov al,80h
out dx,al
mov dx,0c802h
mov al,200
mov cx,n
l1:out dx,al
push cx
call delay
ror al,01
pop cx
loop l1
mov dx,0c802h
mov al,200
mov cx,n
l2:
out dx,al
push cx
call delay
rol al,01
pop cx
loop l2

mov ah,4ch
int 21h
delay proc near
push ax
push dx
mov cx,07FFFH
l4:mov ax,0Ffffh
l3:dec ax
jnz l3
loop l4
pop dx
pop ax
ret
delay endp
code ends
end start
