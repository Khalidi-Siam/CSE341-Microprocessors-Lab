.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here 

arr1 db 5 dup(?)

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov cx, 5
mov si, 0 


;take user input 5 numbers
input:

mov ah, 1
int 21h

sub al, 30h

mov arr1[si], al
inc si

loop input




;selection sort

mov cx, 0  ; i


outer_loop: 

    mov si, cx;min index
    
    mov di,cx
    inc di  ; j 
     
    inner_loop: 
        
        mov bl, arr1[di]
        mov bh, arr1[si]
        
        cmp bl, bh
        jl change_min_idx
        jmp check
        
        
        change_min_idx:
        mov si, di 
        
        check:
        inc di
        cmp di, 5
        jl inner_loop 
        
        
    ;swap       
    mov di,cx 
    mov bl, arr1[di]
    mov bh, arr1[si]
    
    
    mov arr1[di], bh
    mov arr1[si], bl



    inc cx
    cmp cx, 4
    jl outer_loop   
    
    
;next line
mov dl, 0Dh
mov ah, 2  
int 21h


mov dl, 0Ah
mov ah, 2
int 21h



mov si, 0

print_sort_arr:


mov dl, arr1[si]
add dl, 30h
mov ah, 2
int 21h

inc si


cmp si, 5
jl print_sort_arr






 

;exit to DOS
               

MAIN ENDP
    END MAIN