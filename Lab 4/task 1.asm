.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov cx, 80

mov dl, '*'
mov ah, 2

start:  
int 21h 
loop start



;exit to DOS


MAIN ENDP
    END MAIN
