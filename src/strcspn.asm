BITS 64

section .text

GLOBAL strcspn 

strcspn:
    push rbp
    mov rbp, rsp
    xor r11, r11
    mov r12, rsi

cond_a:
    cmp byte[rdi], 0
    je exit
    cmp r11, 0
    jne cond_c
    inc r11
    jmp cond_b

cond_c:
    inc rdi
    inc r11
    mov rsi, r12
    jmp cond_b

cond_b:
    cmp byte[rsi], 0
    je cond_a
    mov r14b, [rdi]
    cmp [rsi] , r14b
    je exit
    inc rsi
    jmp cond_b

exit:
    dec r11
    mov rax, r11
    leave
    ret