TITLE hello
.MODEL small
.STACK 100h
.DATA
v db 5 dup(0) 
.CODE
Start:
mov bx,0 ; initializam contorul vectorului cu 0
@inceput_bucla_citire:
cmp bx,5 ; parcurgem crescator vectorul, daca bx = 5 atunci se iese din bucla
je @dupa_bucla_citire

mov ah,1 ; functia de citire de la tastatura
int 21h
mov v[bx],al ; copiem elementul citit din registru in vector
add bx,1 ; i++
jmp @inceput_bucla_citire
@dupa_bucla_citire:

mov bx,5 ; astfel incat sa nu fie mai mult de 5 elemente in vector

@inceput_bucla_scriere:
cmp bx,0 ; parcurgem invers vectorul, pana cand bx = 0
je @dupa_bucla_scriere
sub bx,1  ; i--
mov dl,v[bx] ; functia de afisare
mov ah,2
int 21h
jmp @inceput_bucla_scriere
@dupa_bucla_scriere:

mov ah,4ch
int 21h
END Start