.MODEL SMALL 

display macro string

lea dx, string
mov ah, 9
int 21h    
    
endm
 
.STACK 100H

.DATA

; declare variables here 
string dw "My name is Siam$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
display string

 

;exit to DOS
               

MAIN ENDP
    END MAIN