   .MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
A dw "Enter month number: $"
days28 dw "28 days$"
days30 dw "30 days$"
days31 dw "31 days$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here


lea dx, A
mov ah, 9
int 21h



mov ah, 1
int 21h 
sub al, 30h



mov bl, al



mov dl, 0Dh
mov ah, 2
int 21h  

mov dl, 0Ah
mov ah, 2
int 21h

mov ah, 0

cmp bl, 2
je daysTwentyEight

mov al, bl
mov bh, 2
div bh

mov ch, ah

cmp ch, 0
je daysThirty

lea dx, days31
mov ah, 9
int 21h

jmp end


daysTwentyEight:

lea dx, days28
mov ah, 9
int 21h

jmp end 


daysThirty:

lea dx, days30
mov ah, 9
int 21h



end:
 

;exit to DOS


MAIN ENDP
    END MAIN
