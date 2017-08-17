assume cs:code, ds:data
data segment
a db ?
data ends
code segment
start:
mov ax,data
mov ds,ax

mov ah,1
int 21h

mov bl,al

mov dl, 10
mov ah,2
int 21h

mov dh, 24
mov dl, 35
mov a,bl
mov bx,0
mov ah,2
int 10h

mov bl,a

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
