;take three number as user input
;print the maximum

.MODEL SMALL 

maximum macro num1, num2, num3
    

mov bl, num1
mov bh, num2
mov cl, num3

cmp bl,bh
jg check_bl_cl 

cmp bh, cl
jg print_bh

jmp print_cl



check_bl_cl:
cmp bl, cl
jg print_bl 
jmp print_cl



print_bl:
mov dl, bl
mov ah, 2
int 21h
jmp end


print_bh:
mov dl, bh
mov ah, 2
int 21h
jmp end


print_cl:
mov dl, cl
mov ah, 2
int 21h


end:    
                       
    
endm 

 
.STACK 100H

.DATA

; declare variables here 


.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 

mov ah, 1
int 21h

mov bl, al 


mov ah, 1
int 21h 

mov bh, al


mov ah, 1
int 21h

mov cl, al


mov dx, 0Ah
mov ah, 2
int 21h

mov dx, 0Dh
mov ah, 2
int 21h 


maximum bl, bh, cl


 

;exit to DOS
               

MAIN ENDP
    END MAIN