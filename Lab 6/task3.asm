.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
size dw ?


a db "Unique$"
b dw "Not Unique$"
arr1 db size dup(?)  



.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov ah, 1
int 21h

mov ah, 0
sub al, 30h 

mov size, ax 

;new line
mov dx, 0Ah
mov ah, 2
int 21h

mov dx, 0Dh
mov ah, 2
int 21h


mov cx, size


input_loop:

mov ah, 1
int 21h

mov ah, 0



push ax

loop input_loop 


;new line
mov dx, 0Ah
mov ah, 2
int 21h

mov dx, 0Dh
mov ah, 2
int 21h


mov cx, size
cmp cx, 1
je unique 



pop ax
mov ah, 0
mov si, 0
mov arr1[si], al


inc si

mov cx, size
dec cx

outer_loop: 
    pop ax
    mov ah, 0
    
    mov di, 0
    
    inner_loop:
        cmp arr1[di], al
        je not_unique
        
        inc di
        cmp di, si
        jl inner_loop
        

    mov arr1[si], al
    inc si
    
    
    loop outer_loop
    






unique:

lea dx, a
mov ah, 9
int 21h

jmp exit  


not_unique: 

lea dx, b
mov ah, 9
int 21h




 
 
exit:   
    
;exit to DOS
               

MAIN ENDP
    END MAIN