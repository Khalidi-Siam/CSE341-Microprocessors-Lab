;take user input x and n
;store the result in AX register

org 100H

.DATA

; declare variables here
x dw "Enter the number(x): $"
n dw "Exp (n): $"

.CODE 




MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

;input x
lea dx, x
mov ah, 9
int 21h

mov ah, 1
int 21h

mov bl, al
sub bl, 30h ; bl store (x)



mov dx, 0Ah
mov ah, 2
int 21h

mov dx, 0Dh
mov ah, 2
int 21h 



;input n

lea dx, n
mov ah, 9
int 21h


mov ah, 1
int 21h

mov cl, al
sub cl, 30h ; cl store (n)



mov dx, 0Ah
mov ah, 2
int 21h

mov dx, 0Dh
mov ah, 2
int 21h


call power
;resutl will store at ax register

jmp end







power proc
    
    mov ax, 1
    mov ch, 0
    cmp cx, 0
    je proc_end
    
    power_loop:
    
    mul bl
    
    loop power_loop
   

    proc_end:
    
    ret 
    
    
power endp


 

;exit to DOS
               
end:
