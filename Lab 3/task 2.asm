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
mov al, '}'
mov bl, '{'

cmp al, bl
jl alSmall

mov ah, 2
mov dl, bl
int 21h 

jmp end  
         
         
alSmall:
mov ah, 2
mov dl, al
int 21h



end:
