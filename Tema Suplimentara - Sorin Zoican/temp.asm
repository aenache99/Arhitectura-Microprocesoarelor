TITLE temp
.MODEL small
.STACK 100h
.DATA
numeprog db 25 dup(0ah), 'Transformare temperatura. $'
citire1 db 2 dup(0ah),0dh,'Introduceti temperatura: $'
citire2 db 2 dup(0ah),0dh,'Grade: C/F $'
afisarec db 2 dup(0ah),0dh,'Temperatura convertita in grade Celsius este: $'
afisaref db 2 dup(0ah),0dh,'Temperatura convertita in grade Fahrenheit este: $'
temp db 2 dup(0) 
grad db 2 dup(0) 
rez db 2 dup(0)
.CODE
Start:
mov AX, @DATA
mov DS, AX
mov DX, offset numeprog ; numele programului
mov AH, 9
int 21h

mov DX, offset citire1 ; mesaj de citire a temperaturii
mov AH, 9
int 21h

mov AH, 1
int 21h
sub AL, '0'
mov temp, AL

mov DX, offset citire2 ; mesaj de specificare a gradelor, celsius sau fahrenheit
mov AH, 9
int 21h

mov AH, 1 ; functia de citire de la tastatura cu ecou
int 21h

mov grad, AL

cmp grad, 'C' ; daca temperatura citita este in grade celsius, face jump la @conversie_fahrenheit

je @conversie_fahrenheit

jmp @conversie_celsius

@conversie_fahrenheit:
mov AL, temp
mov BL, 9
mul BL
mov BL, 5
div BL
add AL, 32
mov rez, AL

mov dx, offset afisaref
mov ah, 9
int 21h

mov ah, 2
int 21h

jmp @final

@conversie_celsius:
mov AL, temp
sub AL, 32
mov BL, 5
mul BL
mov BL, 9
div BL
mov rez, AL

mov DX, offset afisarec
mov AH, 9
int 21h

mov AH, 2
int 21h

@final:
mov AH,4ch
int 21h
END Start