  .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
A dw ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov ah, 1
int 21h

cmp al, '1'
je printO

cmp al, '3'
je printO

cmp al, '2'
je printE

cmp al, '4'
je printE

 

printO:
mov dl, 'o'
mov ah, 2
int 21h
jmp end 



printE:
mov dl, 'e'
mov ah, 2
int 21h

     


end: 
       

 

;exit to DOS


MAIN ENDP
    END MAIN
