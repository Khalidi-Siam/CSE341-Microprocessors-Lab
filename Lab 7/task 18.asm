;assume array given
;check whether element exists or not
;then print exists or not exists

org 100H

.DATA

; declare variables here
arr1 db 1, 2, 5, 6, 4
;assume array given

found dw "Value exists in the array$"
not_found dw "Value doesn't exists$"
input dw "Enter a value to check: $"

.CODE 




MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

lea dx, input
mov ah, 9
int 21h

mov ah, 1
int 21h

mov bl, al
sub bl, 30h ; bl store the element

mov dl, 0Ah
mov ah, 2
int 21h

mov dl, 0Dh
mov ah, 2
int 21h


call array_check

 

jmp end




array_check proc
    
mov si, 0

mov cx, 5

loop_check:

cmp arr1[si], bl
je value_found


inc si
loop loop_check


value_not_found:
lea dx, not_found
mov ah, 9
int 21h
jmp proc_end


value_found:
lea dx, found
mov ah, 9
int 21h
    

proc_end:
    
    ret 
    
    
array_check endp


 

;exit to DOS
               
end:


