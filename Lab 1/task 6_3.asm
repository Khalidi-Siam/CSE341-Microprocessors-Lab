;C = A + (B + 1); use inc

.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
A DW 5
B DW 6
C DW ? 


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AX, A
MOV BX, B
INC BX
ADD AX, BX
MOV CX,AX 
MOV C,CX



;exit to DOS
               


MAIN ENDP
    END MAIN
