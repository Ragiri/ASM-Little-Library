BITS 64

section .text

GLOBAL strcmp

strcmp:
    push rbp
    mov rbp, rsp
    mov r8, rdi
    mov r9, rsi

myloop:
    cmp byte[r8], 0
    je cond_u
    cmp byte[r9], 0
    je exit_ter
    mov r14b, byte[r9]
    cmp [r8], r14b
    jne cond_b
    inc r8
    inc r9
    jmp myloop

cond_u:
    cmp byte[r9], 0
    je exit
    jmp exit_bis

cond_b:
    cmp [r8], r14b
    jl exit_bis
    jmp exit_ter

exit:
    mov rax, 0
    leave
    ret

exit_bis:
    mov rax, -1
    leave
    ret

exit_ter:
    mov rax, 1
    leave
    ret