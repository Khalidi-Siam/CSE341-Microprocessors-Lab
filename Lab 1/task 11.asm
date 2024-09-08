          .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
A DB ?
B DB ?
C DB ?  

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
 




MOV AH, 2
INC AH
MOV A, AH

MOV BH, 3
DEC BH
MOV B, BH

MOV AL, 2
MOV BH, 1
MUL BH

MOV C, AL   


MOV AL, A
MUL B

MOV BH, 5
DIV BH

MOV A, AL

MOV CL, 3
MOV CH, 2
MOV DL, C

ADD CL, A
ADD CL, CH
SUB CL, DL

MOV A, CL

 

;exit to DOS
               

MAIN ENDP
    END MAIN
