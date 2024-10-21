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

mov dl, 80h
mov bl, 0

start:
mov ah, 2
int 21h

mov cl, dl

mov dl, ' '
mov ah, 2
int 21h 

mov dl, cl
inc dl
inc bl

cmp bl, 10
je reset_bl


continue:
cmp dl, 0FFh
jle start

jmp end


reset_bl:
mov bl, 0
mov cl, dl

mov dl, 0Ah
mov ah, 2
int 21h

mov dl, 0Dh
mov ah, 2
int 21h

mov dl, cl
jmp continue
          
;exit to DOS
end:

MAIN ENDP
    END MAIN
