.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
num db ?
is_prime db ? 
no_prime dw "NO prime number$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov ah, 1
int 21h

mov num, al 
sub num, 30h

mov cl, num  ; loop num to 2   
mov si, 0 ; count

prime_outer:

cmp cl, 1
jle end_outer 

mov dh, 1
mov is_prime, 1

    prime_inner: 
    inc dh
    
    cmp dh, cl
    jge check_prime 
    
    mov ch, 0
    mov ax, cx 
    mov dl, 0
    div dh
    
    cmp ah, 0
    je not_prime
    
    jmp prime_inner 
    
    
    not_prime:
        mov is_prime, 0
        
        
    check_prime:
        cmp is_prime, 1
        jne skip_push
        
    
    mov bl, cl
    mov bh, 0
    push bx
    inc si
    
    
    skip_push:
        dec cl
        jmp prime_outer
        
        
    
end_outer: 
mov cx, si


mov dl, 0Ah
mov ah, 2
int 21h 


mov dl, 0Dh
mov ah, 2
int 21h


cmp cx, 0 
jne print_prime

lea dx, no_prime

mov ah, 9
int 21h

jmp exit





print_prime:
pop dx
add dx, 30h


mov ah, 2
int 21h 


mov dx, ' '
mov ah, 2
int 21h

loop print_prime
                 
                 
exit:
    
    
;exit to DOS
               

MAIN ENDP
    END MAIN