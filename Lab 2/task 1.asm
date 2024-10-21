.MODEL SMALL
 
.STACK 100H

.DATA
a dw "Please insert a character: $"
val dw ?
; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea dx, a

mov ah,9 
int 21h

mov ah, 1
int 21h

mov val, ax

mov ah, 2
mov dl, 0dh
int 21h

mov dl, 0ah
int 21h

mov dx, val
int 21h





 

;exit to DOS
              

MAIN ENDP
    END MAIN
