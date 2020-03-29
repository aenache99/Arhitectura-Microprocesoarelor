TITLE hello
.MODEL small
.STACK 100h
.DATA
.CODE
Start:
mov ax,1 ; suma
mov dx,0 ; contorul
@suma: 
add dx,ax ; ax + dx
inc ax ; echivalent cu ax++
cmp ax,10 
jne @suma ; echivalent cu do while (ax != dx)

mov ah,4ch
int 21h
END Start