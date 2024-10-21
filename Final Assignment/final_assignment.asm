org 100H

print_space_comma macro
    
mov dl, ','
mov ah, 2
int 21h 

mov dl, ' '
mov ah, 2
int 21h    
    
    
endm

triangle macro num

mov bl, num 
cmp bl, 0
je end_macro

mov cl, 1
mov ch, 0


check_loop:
mov ax, cx
inc cl

mul cl
mov dl, 2
div dl


;dx used in num_print procedure
mov dx, ax
call num_print


cmp cl, bl
jg end_macro

print_space_comma


cmp cl,bl
jle check_loop


end_macro: 
    
endm


print_prompt macro prompt
    
lea dx, prompt
mov ah, 9
int 21h
endm


new_line macro    
    
mov dx, 0Ah
mov ah, 2
int 21h

mov dx, 0Dh
mov ah, 2
int 21h

endm

.DATA

; declare variables here

temp1 db ?
temp2 db ?
temp3 db ?
instruction dw "Press enter after taking each input$" 

part1 dw "*** Part 1 ***$"
part2 dw "*** Part 2 ***$"
part3 dw "*** Part 3 ***$"

;for first part
prompt1 dw "Enter the number(n): $" 


;second part

;assume max 30 element will store
arr1 db 30 dup(?) 

first_term_prompt dw "First term = $"
common_diff_prompt dw "Common difference = $"
limit_prompt dw "Limit = $"

first_term db ?
common_diff db ?
limit db ?


;3rd part
stack_count dw ?
array_count dw ?
is_prime db ? 
reversed_prompt dw "Reversed sequence: $" 
no_prime dw "NO Prime Found$"                       


.CODE   

MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

print_prompt instruction

new_line


;start part 1 
print_prompt part1

new_line


print_prompt prompt1 


call number_input

 
mov cl, al

new_line


triangle cl

;end part 1 


new_line



;start part 2
print_prompt part2

new_line


print_prompt first_term_prompt


call number_input

mov first_term, al ; store first_term       
        
        
;new line        
new_line
        

print_prompt common_diff_prompt


call number_input

mov common_diff, al ; store common_diff 


new_line


print_prompt limit_prompt 


call number_input


mov limit, al  ;store limit 


call arithmetic

;end part 2 


new_line 


;start part 3
print_prompt part3

new_line  

call reversal

;end part 3

jmp end  


arithmetic proc
    
    
mov cx, 0 ;count element will stored in array    

mov bl, first_term  ;i value

 
mov si, 0

loop_add: 

mov arr1[si], bl


inc si
inc cx 

add bl, common_diff

cmp bl, limit
jl loop_add

mov array_count, cx


new_line

mov si, 0
print_array:

mov dl, arr1[si]
mov dh, 0

call num_print


inc si
dec cx
cmp cx, 0
je print_array_end

   
print_space_comma

jmp print_array


print_array_end:
    
    
    ret
    
arithmetic endp  


reversal proc


mov si, 0
 
mov stack_count, 0

prime_outer:

cmp si, array_count
jge end_outer 
 

mov cl, arr1[si]   

   

mov dh, 1
mov is_prime, 1 

cmp cl, 0
je skip_push

cmp cl, 1
je skip_push


cmp cl, 2
je push_stack

    prime_inner: 
    inc dh
    
    cmp dh, cl
    jge check_prime 
    
    mov ch, 0
    mov ax, cx 
    mov dl, 0
    div dh
    
    cmp ah, 0
    je not_prime
    
    jmp prime_inner 
    
    
    not_prime:
        mov is_prime, 0
        
        
    check_prime:
        cmp is_prime, 1
        jne skip_push
        
    
    
    push_stack:
    mov bl, cl
    mov bh, 0
    push bx
    inc si
    add stack_count, 1
    jmp prime_outer
    
    
    skip_push:
        inc si
        jmp prime_outer        
        
    
end_outer:


mov cx, stack_count
cmp cx, 0
jne continue


print_prompt no_prime


jmp end_loop

 

continue:

print_prompt reversed_prompt

print_prime:

pop dx 

call num_print


dec cx
cmp cx, 0
je end_loop


print_space_comma

jmp print_prime

 

end_loop:     
    
    
    
    ret
    
reversal endp 



number_input proc


mov temp1, bl
mov temp2, bh
mov temp3, ch

    
mov ah, 1
int 21h



mov bl, al
sub bl, 30h

mov ah, 1
int 21h

cmp al, 0Dh
je number_input_end


mov ah, 0
mov bh, al
sub bh, 30h
mov al, bl

mov ch, 10
mul ch

add al, bh

mov bl, al


mov ah, 1
int 21h

cmp al, 0Dh
je number_input_end


jmp number_input_end


number_input_end:
mov al, bl

mov bl, temp1
mov bh, temp2
mov ch, temp3
;restore previous value
;to prevent unintentional bug
    
    ret
    
number_input endp


num_print proc
    
mov temp1, bl
mov temp2, bh
mov temp3, al
    
cmp dx, 9
jg double


add dx, 30h

mov ah, 2
int 21h

jmp proc_end


double: 

mov ax,dx
mov bl, 10
div bl

mov bl, al
mov bh, ah

mov dl, bl
add dl, 30h
mov ah, 2
int 21h


mov dl, bh 
add dl, 30h
mov ah, 2
int 21h



proc_end:    

mov bl, temp1
mov bh, temp2
mov al, temp3 
;restore previous value   
    
    ret    
    
num_print endp

end:

;exit to DOS
           
