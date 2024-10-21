
   .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
A dw "Odd Number$"
B dw "Even Number$"

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


mov bl, 2
div bl 
mov cl, ah 


mov dl, 0Dh
mov ah, 2 
int 21h

mov dl, 0Ah
mov ah, 2
int 21h 


cmp cl, 0 
je printEven

lea dx,A
mov ah, 9
int 21h

jmp end 



printEven:
lea dx, B
mov ah, 9
int 21h



end:
 

;exit to DOS


MAIN ENDP
    END MAIN
