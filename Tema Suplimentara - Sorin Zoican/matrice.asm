title matrice
.model small
.stack 100h
.data
    matrix1 db 0,0,0,0
    matrix2 db 0,0,0,0
    matrix3 db 0,0,0,0
    msg db "Introduceti elementele matricii 1: $"
    msg1 db "Introduceti elementele matricii 2: $"
    msg2 db "Rezultatul este:  $"
    next db 13,10,"$"
.code
main proc
    mov ax,@data
    mov DS,ax
    
    mov bx,offset matrix1
    call Matrix1InputMsg
    call Nextline
    call InputMatrix
    call Nextline
    
    mov bx,offset matrix2
    call Matrix2InputMsg
    call Nextline
    call InputMatrix
    
    call MatrixMultiplication
    
    call Nextline
    call ResultantMsg 
    call Nextline
    call Nextline 
    call Output
    
    .exit
    main endp

Output proc near
    
    mov bx,offset matrix1
    mov ah,02h
    mov dl,[bx+0] 
    
    cmp dl,0
    jnl down6
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down6:
    
    add dl,30h
    int 21h
    mov dl,32
    int 21h
    mov dl,[bx+1] 
    
    cmp dl,0
    jnl down7
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down7:
    
    add dl,30h
    int 21h

    mov dl,9
    int 21h
    
    mov bx,offset matrix2

    mov dl,[bx+0]
    
    cmp dl,0
    jnl down8
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down8:
    
    add dl,30h
    int 21h
    mov dl,32
    int 21h
    mov dl,[bx+1]
    
    cmp dl,0
    jnl down9
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down9:
    
    add dl,30h
    int 21h

    mov dl,9
    int 21h 
    mov bx,offset matrix3

    xor dx,dx
    mov dl,[bx+0] 
    
    cmp dl,0
    jnl down10
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down10:
    
    cmp dl,9
    ja down
    add dl,30h
    int 21h
    jmp exit
   
    down:
    xor ax,ax
    mov al,dl
    mov cl,10
    div cl
    mov dl,al
    mov dh,ah
    mov ah,02h
    add dl,30h
    int 21h
    mov dl,dh
    add dl,30h
    int 21h 
    exit:   
    
    mov dl,32
    int 21h
    mov dl,[bx+1]
    
    cmp dl,0
    jnl down11
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down11:
    
    cmp dl,9
    ja down1
    add dl,30h
    int 21h
    jmp exit1
   
    down1:
    xor ax,ax
    mov al,dl
    mov cl,10
    div cl
    mov dl,al
    mov dh,ah
    mov ah,02h
    add dl,30h
    int 21h
    mov dl,dh
    add dl,30h
    int 21h 
    exit1:   

    call Nextline
    mov bx,offset matrix1
    mov ah,02h

    mov dl,[bx+2]
    
    cmp dl,0
    jnl down12
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down12:
    
    add dl,30h
    int 21h
    mov dl,32
    int 21h
    mov dl,[bx+3]
    
    cmp dl,0
    jnl down13
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down13:
    
    add dl,30h
    int 21h

    mov dl,9
    int 21h
    mov bx,offset matrix2

    mov dl,[bx+2]
    
    cmp dl,0
    jnl down14
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down14:
    
    add dl,30h
    int 21h
    mov dl,32
    int 21h
    mov dl,[bx+3] 
    
    cmp dl,0
    jnl down15
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down15:
    
    add dl,30h
    int 21h

    mov dl,9
    int 21h 
    mov bx,offset matrix3

    mov dl,[bx+2]
    
    cmp dl,0
    jnl down16
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down16:
    
    cmp dl,9
    ja down2
    add dl,30h
    int 21h
    jmp exit2
   
    down2: 
    xor ax,ax
    mov al,dl
    mov cl,10
    div cl
    mov dl,al
    mov dh,ah
    mov ah,02h
    add dl,30h
    int 21h
    mov dl,dh
    add dl,30h
    int 21h 
    exit2:   
    
    mov dl,32
    int 21h
    mov dl,[bx+3]
    
    cmp dl,0
    jnl down17
    neg dl
    mov dh,dl
    mov ah,02h
    mov dl,45
    int 21h
    mov dl,dh
    down17:
    
    cmp dl,9
    ja down3
    add dl,30h
    int 21h
    jmp exit3
   
    down3:
    xor ax,ax
    mov al,dl
    mov cl,10
    div cl
    mov dl,al
    mov dh,ah
    mov ah,02h
    add dl,30h
    int 21h
    mov dl,dh
    add dl,30h
    int 21h 
    exit3:   
    
    ret
    Output endp

MatrixMultiplication proc near
    
    mov si,0
    againouterloop:
    cmp si,2
    jae exitouterloop
    
    mov di,0
    againcenterloop:
    cmp di,2
    jae exitcenterloop
    
   
    mov ax,si
    mov bl,2
    mul bl
    add ax,di
    push si
    mov si,ax
    mov bx,offset matrix3
    mov [bx+si],0
    pop si
    
    mov cx,0
    againinnerloop:
    cmp cx,2
    jae exitinnerloop 
    
    mov ax,si
    mov bl,2
    mul bl
    add ax,cx
    push si
    mov si,ax
    mov bx,offset matrix1
    mov dx,[bx+si]
    pop si
    
    mov ax,cx
    mov bl,2
    mul bl
    add ax,di
    push si
    mov si,ax
    mov bx,offset matrix2
    mov ax,[bx+si]
    pop si
    
    mul dl
    
    xor dx,dx
    mov dx,ax
    
    mov ax,si
    mov bl,2
    mul bl
    add ax,di
    push si
    mov si,ax
    mov bx,offset matrix3
    mov ax,[bx+si]
    add dx,ax
    mov [bx+si],dl    
    pop si
    
    inc cx 
    jmp againinnerloop
    
    exitinnerloop:
    inc di
    jmp againcenterloop
    exitcenterloop:
    
    inc si
    jmp againouterloop
    exitouterloop:
    
    ret
    MatrixMultiplication endp

InputMatrix proc near
    push ax
    mov si,0
    again:
    cmp si,4
    je exitloop
    call CharacterRead
                 
    cmp al,45
    je down5           
    sub al,30h
    mov [bx+si],al
    jmp exit5 
    
    down5:
    call CharacterRead
    mov cl,-1
    sub al,30h
    mul cl
    mov [bx+si],al
    
    exit5:
    inc si
    call Nextline
    jmp again
    exitloop:
    pop ax
    ret
    InputMatrix endp

CharacterRead proc near
    mov ah,01h
    int 21h
    ret
    CharacterRead endp

Matrix1InputMsg proc near
    push dx
    push ax
    mov dx,offset msg
    mov ah,09h
    int 21h
    pop ax
    pop dx
    ret
    Matrix1InputMsg endp

Matrix2InputMsg proc near
    push dx
    push ax
    mov dx,offset msg1
    mov ah,09h
    int 21h
    pop ax
    pop dx  
    ret
    Matrix2InputMsg endp

ResultantMsg proc near
    push dx
    push ax
    mov dx,offset msg2
    mov ah,09h
    int 21h
    pop ax
    pop dx
    ret
    ResultantMsg endp

Nextline proc near
    push ax
    push dx
    mov ah,09h
    mov dx,offset next
    int 21h
    pop dx
    pop ax   
    ret
    Nextline endp

end