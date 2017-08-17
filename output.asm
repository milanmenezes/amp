assume cs:code, ds:data
data segment
data ends
code segment
start:
mov ax,data
mov ds,ax
mov ah,1
int 21h

mov bl,al

mov dl,bl
mov ah,2
int 21h
mov dl, ':'
mov ah,2
int 21h
mov al,bl
aam
mov bx,ax
add bl, 30h
add bh, 30h
mov dl, bh
mov ah,2
int 21h
mov dl, bl
mov ah,2
int 21h
mov ah, 4ch
int 21h
code ends
end start
