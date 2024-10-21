.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
A dw "Enter a hex digit: $" 
B dw "In decimal it is $"


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here



lea dx, A
mov ah, 9
int 21h 


mov ah,1
int 21h
mov bl, al



mov dl, 0Dh
mov ah, 2
int 21h

mov dl, 0Ah
mov ah, 2
int 21h


lea dx, B
mov ah, 9
int 21h

mov dl, '1'
mov ah, 2
int 21h

sub bl, 11h
mov dl, bl
mov ah, 2
int 21h
        
       

         
;exit to DOS
               


MAIN ENDP
    END MAIN
