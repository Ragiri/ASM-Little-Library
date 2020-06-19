BITS 64

section .text

GLOBAL memcpy

memcpy:
    push rbp
    mov rbp, rsp
    xor r11, r11
    xor r14b, r14b

myloop:
    cmp r11, rdx
    je exit
    mov r14b, byte [rsi + r11]
    mov byte [rdi + r11], r14b
    inc r11
    jmp myloop

exit:
    mov rax, rdi
    leave
    ret