data segment
msg db 13,10,"number of ps:$"
data ends

code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov al,82h
mov dx,0c803h
out dx,al
mov dx,0c801h
in al,dx
mov bl,al
and al,al
jpe eparity
mov al,00
jmp disp

eparity:
mov al,0ffh

disp:
mov dx,0c800h
out dx,al
lea dx,msg
mov ah,09h
int 21h
mov ah,08h
int 21h
mov cx,8
mov al,0

l1:
ror bl,1
jc l2
jmp l3

l2:
inc al

l3:
loop l1
mov dx,0c800h
out dx,al
mov dl,al
add dl,30h
mov ah,02h
int 21h
mov ah,4ch
int 21h
code ends
end start


