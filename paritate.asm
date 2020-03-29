TITLE hello
.MODEL small
.STACK 100h
.DATA
.CODE
Start:
mov AH,1 ; comanda de citire de la tastatura cu ecou
int 21h

AND AX, 1 ; verifica paritatea
mov CX, AX ; copiem ce avem in AX in CX
cmp CX, 1 ; comparam CX cu 1 asta fiind conditia pentru jump if equal
je @nu_sunt_pare ; if ax % 2 !== 0, atunci sar la @nu_sunt_pare
; partea din else, adica ax % 2 == 0
mov DL, '0' ; DL ia valoarea 0
mov ah, 2 ; functia de afisare pe ecran
int 21h
jmp @final ; sare la finalul programului
@nu_sunt_pare:
mov DL, '1' ; DL ia valoarea 1
mov ah, 2 ; functia de afisare pe ecran
int 21h

@final:
mov ah,4ch
int 21h

END Start