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

mov ax, 5
mov bx, 6
mov cx, 0

start:
add cx, ax
dec bx

cmp bx, 1
jnl start

          
;exit to DOS


MAIN ENDP
    END MAIN
