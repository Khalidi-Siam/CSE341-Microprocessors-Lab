;X * Y / Z

.MODEL SMALL
 
.STACK 100H

.DATA

X DB 4
Y DB 4
NUM3 DW ?

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

MOV AL,X
MUL Y
MOV NUM3, AX
;MOV CL, 7
;DIV CL

 

;exit to DOS
               

MAIN ENDP
    END MAIN
