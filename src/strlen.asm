BITS 64

section .text

GLOBAL strlen

strlen:
    push rbp
    mov rbp, rsp
    xor r11, r11

myloop:
    cmp byte [rdi], 0
    je exit
    inc r11
    inc rdi
    jmp myloop

exit:
    mov rax, r11
    leave
    ret