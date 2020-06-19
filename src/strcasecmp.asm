BITS 64

section .text

GLOBAL strcasecmp

strcasecmp:
    push rbp
    mov rbp, rsp
    xor r11, r11
loop:
    mov r14b, byte [rdi + r11]
    mov r10b, byte [rsi + r11]
    jmp min_b

min_b:
    cmp r14b, 'A'
    jl  min_a
    cmp r14b, 'Z'
    jg min_a
    add r14b, 32

min_a:
    cmp r10b, 'A'
    jl endl
    cmp r10b, 'Z'
    jg endl
    add r10b, 32

endl:
    cmp r14b, r10b
    jne exit
    cmp r14b, 0
    je exit_bis
    inc r11
    jmp loop

exit:
    sub r14b, r10b
    movsx rax, r14b
    leave
    ret

exit_bis:
    mov rax, 0
    leave
    ret