assume cs: code. ds:data
data segment
str1 db "abcba"
len db $-str1
strrev db 20 dup(?)
m1 db "Palindrome$"
m2 db "Not Palindrome$"
data ends
code segment
start:
mov ax,data
mov ds,ax
mov es,ax
mov cx, len
lea si,str1
lea di,len
add di,cx

cld

l1:
 mov al,[di]
 mov [si],al
 
 dec di
 inc si
 loop l1;
 
mov cx,len
lea si, str1
lea di, strrev
cld
repe cmpsb
je l2
lea dx,m2
jmp l3
l2: 
lea dx,m1

l3:
mov ah,9
int 21h

mov ah,4ch
int 21h
code ends
end start