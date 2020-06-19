BITS 64

section .text

GLOBAL strpbrk 

strpbrk:
    push rbp
    mov rbp, rsp
    xor r11, r11
    mov r10, rsi 

cond_a:
    cmp byte[rdi], 0
    je exit_bis
    cmp r11, 0
    jne cond_c
    inc r11
    jmp cond_b

cond_c:
    inc rdi
    mov rsi, r10
    jmp cond_b

cond_b:
    cmp byte[rsi], 0
    je cond_a
    mov r14b, [rdi]
    cmp r14b, [rsi]
    je exit
    inc rsi
    jmp cond_b

exit:
    mov rax, rdi
    leave
    ret

exit_bis:
    mov rax, 0
    leave
    ret