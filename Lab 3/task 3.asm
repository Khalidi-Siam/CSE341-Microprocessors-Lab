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
mov ax, 5


cmp ax, 0
jl lessThanZero
jg greaterThanZero

mov bx, 0
mov A, bx
jmp end

lessThanZero:
mov bx, -1 
mov A, bx
jmp end

greaterThanZero:
mov bx, 1 
mov A, bx



end:






 

;exit to DOS


MAIN ENDP
    END MAIN
