.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
A dw "Enter three Initials: $"


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here



lea dx, A
mov ah, 9
int 21h 


mov ah,1
int 21h
mov bl, al

mov ah,1
int 21h
mov bh, al

mov ah,1
int 21h
mov cl, al



mov dl, 0Dh
mov ah, 2
int 21h

mov dl, 0Ah
mov ah, 2
int 21h


mov dl, bl
mov ah, 2
int 21h
        
        


mov dl, 0Dh
mov ah, 2
int 21h

mov dl, 0Ah
mov ah, 2
int 21h


mov dl, bh
mov ah, 2
int 21h





mov dl, 0Dh
mov ah, 2
int 21h

mov dl, 0Ah
mov ah, 2
int 21h


mov dl, cl
mov ah, 2
int 21h
         
;exit to DOS
               


MAIN ENDP
    END MAIN
