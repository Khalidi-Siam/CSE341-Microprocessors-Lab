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

mov cl, 0  ;loop counter

input_loop:

mov ah, 1
int 21h

cmp al,0Dh
je end 

mov ah, 0

push ax

inc cl
cmp cl, 50h
jl input_loop




end:

mov dl, 0Ah
mov ah, 2
int 21h

mov dl, 0Dh
mov ah, 2
int 21h

mov bl, 0

print_loop:
pop dx

mov ah, 2
int 21h

inc bl
cmp bl, cl
jl print_loop



 

;exit to DOS
               

MAIN ENDP
    END MAIN