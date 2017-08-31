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

mov a,al

mov dl, 10
mov ah,2
int 21h

mov bl,a
mov cx,4
shr bl,cl

cmp bl, 10
jl l1
add bl,37h
jmp l2
l1:
add bl,30h

l2:
mov dl,bl
mov ah,2
int 21h

mov bl,a
mov cx,4
shl bl,cl
shr bl,cl

cmp bl, 10
jl l3
add bl,37h
jmp l4
l3:
add bl,30h
l4:
mov dl,bl
mov ah,2
int 21h

mov ah,4ch
int 21h

code ends
end start