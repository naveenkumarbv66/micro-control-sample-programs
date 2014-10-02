;3b
data segment
msg1 db  0ah,0dh,'Enter X from LCX and press any key to continue$'
msg2 db 0ah,0dh,'Enter Y from LC An dpress any key$'
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov dx,0c803h
mov al,82h
out dx,al
lea dx,msg1
mov ah,09h
int 21h
mov ah,08h
int 21h
mov dx,0c801h
in al,dx
mov bl,al
lea dx,msg2
mov ah,09h
int 21h
mov ah,08h
int 21h
mov dx,0c801h
in al,dx
mov ah,00
mul bl
mov dx,0c800h
out dx,al
mov ah,4ch
int 21h
code ends
end start


