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

mov ax, 0
mov bx, 100

start:
add ax, bx
sub bx, 5

cmp bx, 5
jge start


 

;exit to DOS


MAIN ENDP
    END MAIN
