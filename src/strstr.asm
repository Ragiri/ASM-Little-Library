bits 64
section .text

global strstr

strstr:
    push rbp
    mov rbp, rsp
    xor rbx, rbx

loop:
    mov r8, rbx
    xor r9, r9
    jmp cond_a

incr:
    inc r8
    inc r9

cond_a:
    mov r13b, byte [rsi+r9]
    cmp r13b, 0
    je exit_bis
    mov r14b, byte [rdi+r8]
    cmp r14b, 0
    je exit
    cmp r14b, r13b
    je incr
    inc rbx
    jmp loop

exit:
    mov rax, 0
    leave
    ret

exit_bis:
    mov rax, rdi
    add rax, rbx
    leave
    ret