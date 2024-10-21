.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
num db ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov ah, 1
int 21h
sub al, 30h
mov num, al


mov bl, 1

factor:
mov al, num
mov ah, 0
div bl

cmp ah, 0
je push_to_stack
jmp condition


push_to_stack:
mov bh, 0
push bx

condition:
inc bl
cmp bl, num
jle factor



 

;exit to DOS
               

MAIN ENDP
    END MAIN