.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 
prompt1 dw "enter a hex digit: $"
prompt2 dw "in decimal it is $"
prompt3 dw "Do you want to do it again?$"
prompt4 dw "Illegal character - Enter 0..9 or A..F:$"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

start:
lea dx, prompt1
mov ah, 9
int 21h

mov ah, 1
int 21h

mov bl, al

general:
cmp bl, '0'
jge checkLess9
jmp illegal


checkLess9:
cmp bl, '9'
jg nextCondition

mov dl, 0Ah
mov ah, 2
int 21h

mov dl, 0Dh
mov ah, 2
int 21h

lea dx, prompt2 
mov ah, 9
int 21h


mov dl, bl
mov ah, 2
int 21h

jmp nextInput

nextCondition:
cmp bl, 'A'
jg lessThanF


lessThanF:
cmp bl, 'F'
jg illegal

mov dl, 0Ah
mov ah, 2
int 21h

mov dl, 0Dh
mov ah, 2
int 21h

lea dx, prompt2 
mov ah, 9
int 21h

mov dl, '1'
mov ah, 2
int 21h


sub bl, 'A'
add bl, 30h
mov dl, bl
mov ah, 2
int 21h

jmp nextInput 



illegal: 
mov dl, 0Ah
mov ah, 2
int 21h

mov dl, 0Dh
mov ah, 2
int 21h

lea dx, prompt4
mov ah, 9
int 21h
 
mov ah, 1
int 21h

mov bl, al
jmp general




nextInput:
 
mov dl, 0Ah
mov ah, 2
int 21h

mov dl, 0Dh
mov ah, 2
int 21h


lea dx, prompt3
mov ah, 9
int 21h

mov ah, 1
int 21h

mov cl, al

mov dl, 0Ah
mov ah, 2
int 21h

mov dl, 0Dh
mov ah, 2
int 21h

cmp cl, 'y'
je start

cmp cl, 'Y'
je start

jmp end 



end:



 

 

;exit to DOS
               


MAIN ENDP
    END MAIN
