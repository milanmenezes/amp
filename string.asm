include f3.mac
include f4.mac
assume cs: code, ds:data
data segment
s1 db 20
   db ?
   db 20 dup(?)
   
s2 db 20
   db ?
   db 20 dup(?)
   
m1 db "Enter String 1:",10,"$"
m2 db "Enter String 2:",10,"$"
m3 db "Equal",10,"$"
m4 db "Not Equal",10,"$"
m5 db "Length of str1: ",10,"$"
m6 db "Length of str2: ",10,"$"

data ends
code segment
start:
mov ax,data
mov ds,ax
mov es,ax

lea dx,m1
disp

lea dx,s1
mov ah,10
int 21h
newline

lea dx,m2
disp

lea dx,s2
mov ah,10
int 21h
newline

mov al,s1+1
mov bl,s2+1

cmp al,bl
jne not_eq

lea si,s1+2
lea di,s2+2

mov cl,s1+1
mov ch,0

cld
repe cmpsb
je equal
jmp not_eq

equal:
lea dx,m3
disp
jmp l1

not_eq:
lea dx, m4
disp

l1:
lea dx,m5
disp
mov al,s1+1
aam
push ax

mov dl,ah
add dl,30h
mov ah,2
int 21h

pop ax
mov dl,al
add dl,30h
mov ah,2
int 21h

newline

lea dx,m6
disp
mov al,s2+1
aam
push ax

mov dl,ah
add dl,30h
mov ah,2
int 21h

pop ax
mov dl,al
add dl,30h
mov ah,2
int 21h


mov ah,4ch
int 21h
code ends
end start