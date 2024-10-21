.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
A dw "HERE SUM OF $"
B dw " AND $"
C dw " IS $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 
mov dl, '?'
mov ah, 2
int 21h

mov ah,1
int 21h
mov bl, al

mov ah,1
int 21h
mov bh, al



mov dl, 0Dh
mov ah, 2
int 21h

mov dl, 0Ah
mov ah, 2
int 21h



lea dx, A
mov ah, 9
int 21h

mov dl, bl
mov ah, 2
int 21h


lea dx, B
mov ah, 9
int 21h

mov dl, bh
mov ah, 2
int 21h



lea dx, C
mov ah, 9
int 21h



add bl, bh
sub bl, 30h
mov dl, bl
mov ah, 2
int 21h


 

;exit to DOS
               


MAIN ENDP
    END MAIN
