BITS 64

section .text

GLOBAL strncmp

strncmp:
    push rbp
    mov rbp, rsp
    mov r8, rdi
    mov r9, rsi
    xor r11, r11

myloop:
    cmp r11, rdx
    je cond_u
    cmp byte[r9], 0
    je exit_ter
    mov r14b, byte[r9]
    cmp [r8], r14b
    jne cond_b
    inc r8
    inc r11
    inc r9
    jmp myloop

cond_u:
    jmp exit

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
