.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
size dw ?
arr1 db size dup(?)

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov ah, 1
int 21h

sub al, 30h
mov ah, 0
mov size, ax


mov ah, 2
mov dl, 0Dh
int 21h

mov ah, 2
mov dl, 0Ah
int 21h

mov cx, size
mov si, 0

;input string
input:
mov ah, 1
int 21h

mov arr1[si], al 
inc si

loop input



mov ah, 2
mov dl, 0Dh
int 21h

mov ah, 2
mov dl, 0Ah
int 21h



mov cx, size
mov si, 0

;output string
output: 
mov dl, arr1[si]
mov ah, 2
int 21h


inc si 

loop output


 

;exit to DOS
               

MAIN ENDP
    END MAIN