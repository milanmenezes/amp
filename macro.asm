include f1.mac
include f2.mac
assume cs:code, ds:data
data segment
str db 20 dup(?)
data ends
code segment
start:
mov ax,data
mov ds,ax

mov cx,0
mov si,0

l1:
kread
cmp al,13
je l2
mov str[si],al
inc si
inc cx
cmp cx, 20
je l2
jmp l1


l2:
mov dl,10
disp
mov si,0
l3:
mov dl,str[si]
disp
inc si
loop l3

mov ah, 4ch
int 21h
code ends
end start
