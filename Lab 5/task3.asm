.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here
arr1 db 3 dub(?)

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here 


mov si, 0

inputLoop:
mov ah, 1
int 21h

mov arr1[si], al
inc si

cmp si, 3
jl inputLoop


mov dx, 0Ah
mov ah, 2
int 21h  

mov dx, 0Dh
mov ah, 2
int 21h


mov bl, arr1[0]
mov bh, arr1[1]
mov cl, arr1[2]

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
 
 

;exit to DOS
               


MAIN ENDP
    END MAIN