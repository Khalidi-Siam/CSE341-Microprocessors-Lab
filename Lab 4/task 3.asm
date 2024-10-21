.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
A db ?
B db ?
C db ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov cx, 5
start:   

mov ah, 1
int 21h



loop start 

mov ah, 2
mov dl, 0Dh
int 21h 



mov cx, 5
mov ah, 2
new: 
mov dl, 'X'
int 21h 
loop new
          
;exit to DOS


MAIN ENDP
    END MAIN
