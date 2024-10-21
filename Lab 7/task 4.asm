;assume a string already given.
;check on that whether valid or invalid and print

.MODEL SMALL 

parenthesis macro string, flag, valid, invalid, stack_depth

;code similar to cse220 parenthesis balance problem
lea si, string
mov flag, 1 
mov stack_depth, 0


check_loop:

mov al, [si]
cmp al, '$'
je end_loop


cmp al, '('
je open_parenthesis

cmp al, '{'
je open_parenthesis

cmp al, '['
je open_parenthesis



cmp al, ')'
je close_parenthesis

cmp al, '}'
je close_parenthesis

cmp al, ']'
je close_parenthesis 


jmp continue



open_parenthesis:
mov ah, 0
push ax
inc stack_depth
jmp continue


close_parenthesis:
cmp stack_depth, 0
je unbalanced

pop bx ; temp
dec stack_depth
cmp al, ')'
je check_first

cmp al, '}'
je check_second

cmp al, ']'
je check_third

jmp unbalanced


check_first:
cmp bx, '('
je continue
jmp unbalanced 


check_second:
cmp bx, '{'
je continue
jmp unbalanced 


check_third:
cmp bx, '['
je continue
jmp unbalanced  


unbalanced:
mov flag, 0
jmp end_loop


continue:
inc si
jmp check_loop


end_loop:
cmp stack_depth, 0
jne print_invalid


cmp flag, 1
je print_valid


print_invalid:

lea dx, invalid
mov ah, 9
int 21h

jmp exit


print_valid:
lea dx, valid
mov ah, 9
int 21h                     
                     
                     
exit:  
    


endm 

 
.STACK 100H

.DATA

; declare variables here 
string db "(1+3)*(4+7(", "$"
flag db 1
valid dw "Valid$"
invalid dw "Invalid$"
stack_depth db 0


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 
parenthesis string, flag, valid, invalid, stack_depth




;exit to DOS
               

MAIN ENDP
    END MAIN