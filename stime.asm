assume cs:code, ds:data
data segment
data ends
code segment
start:
mov ax,data
mov ds,ax
mov ah,2ch
int 21h

mov al,ch
aam
add ax,3030h
push ax
mov dl,ah
mov ah,2
int 21h

pop ax
mov dl,al
mov ah,2
int 21h

mov dl,':'
mov ah,2
int 21h

mov al,cl
aam
add ax,3030h
push ax
mov dl,ah
mov ah,2
int 21h

pop ax
mov dl,al
mov ah,2
int 21h

mov ah,4ch
int 21h
code ends
end start

