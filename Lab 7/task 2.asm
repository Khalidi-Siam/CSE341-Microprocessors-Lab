;take user input
;result store in AX register

.MODEL SMALL 

factorial macro number
    
  mov cx, number 
  
  mov ax, 1
  cmp cx, 0
  je end
  
  loop_fact:
  
    mul cl
    
    loop loop_fact
    
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
sub al, 30h

mov cl, al


mov ch, 0
factorial cx
 

;exit to DOS
               

MAIN ENDP
    END MAIN