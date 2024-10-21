;first input how many number user want to compare
;then compare and print maximum

org 100H

.DATA

; declare variables here
n db ?
prompt1 dw "how many number you want to compare(n): $"
prompt2 dw "Maximum number: $"

.CODE 




MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
lea dx, prompt1
mov ah, 9
int 21h

mov ah, 1
int 21h

mov n, al
sub n, 30h


mov dx, 0Ah
mov ah, 2
int 21h

mov dx, 0Dh
mov ah, 2
int 21h



mov ah, 1
int 21h

mov bl, al ;first number 

;if user take 1 number input then that is maximum
cmp n, 1
je loop_end


mov ah, 1
int 21h

mov bh, al ;second number

call maximum


mov cl, n
cmp cl, 2
jle loop_end 

loop_compare: 

mov ah, 1
int 21h

mov bh, al

call maximum

dec cl
cmp cl, 2
jg loop_compare



loop_end:

mov dx, 0Ah
mov ah, 2
int 21h

mov dx, 0Dh
mov ah, 2
int 21h

lea dx, prompt2
mov ah, 9
int 21h


mov dl, bl
mov ah, 2
int 21h
 

jmp end




maximum proc
    
cmp bl, bh
jl max_bl
jmp proc_end


max_bl:
mov bl, bh ; store max value in bl always

    
proc_end:
   
    ret 
    
    
maximum endp


 

;exit to DOS
               
end:
