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
mov ax, -1

cmp ax, 0
jnl end ;jnl = jump if not less than

mov ax, 5



end: 

 

;exit to DOS


MAIN ENDP
    END MAIN
