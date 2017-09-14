assume cs:code, ds:data
data segment
num db 99
data ends
code segment
start:
mov ax,data
mov ds,ax
mov cx,100
l:
mov dh,24
mov dl,0
mov bx,0
mov ah,2
int 10h

mov al,num
aam
add ah,30h
add al,30h
push ax
mov dh,0
mov dl,ah
mov ah, 2
int 21h


pop ax
mov dh,0
mov dl,al
mov ah,2
int 21h

call delay
dec num
loop l
 mov ah,4ch
 int 21h
delay proc
push cx
push bx
mov cx,0FFFFH
dl1:mov bx,0FFFH
dl2: dec bx
     jnz dl2
	 loop dl1
	 pop bx
	 pop cx
	 ret
	 delay endp
	 
code ends
end start