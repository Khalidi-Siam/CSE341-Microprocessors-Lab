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
mov ah, 1
int 21h

cmp al, 40h 
jg secondCondition

jmp end



secondCondition:
cmp al, 5Bh
jl printChar

jmp end


printChar: 
mov cl, al

mov dl, 0Dh
mov ah, 2
int 21h

mov dl, 0Ah
mov ah, 2
int 21h

mov dl, cl
mov ah, 2
int 21h




end:






 

;exit to DOS


MAIN ENDP
    END MAIN