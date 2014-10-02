data segment
n dw 15
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov dx,0c803h
mov al,80h
out dx,al
mov dx,0c802h
mov al,77h
mov cx,n

 l1:
 out dx,al
 push cx
 call delay
 ror al,01
 pop cx
 loop l1
 mov ah,4ch
 int 21h

delay proc near
push ax
push cx
mov cx,9fffh
l2:
mov ax,0ffffh

l3:
dec ax
jnz l3
loop l2
pop cx
pop ax
ret
delay endp
code ends
end start



