assume cs:code, ds:data
data segment
A db 1,2,3,4,5,6,7,8,9
len db $-A
key db 12
m1 db "Element found$"
m2 db "Element not found$"
data ends
code segment
start:
mov ax, data
mov ds, ax
mov si, 0
mov ah, 0
mov al, len-1
mov di, ax
mov bx, si
l1:
cmp bx, di
jg l9
mov si, bx
add si, di
shr si, 1
mov al, A[si]
cmp key, al
je l8
jl l6
mov bx, si
add bx, 1
jmp l5
l6:
 mov di, si
 sub di, 1
 l5:
  jmp l1
l8:
  lea dx, m1
  jmp l2
l9:
  lea dx, m2

l2:
  mov ah,9
  int 21h
  mov ah,4ch
  int 21h
code ends
end start