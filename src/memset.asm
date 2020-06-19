BITS 64

section .text

GLOBAL memset

memset:
    push rbp
    mov rbp, rsp
    mov r8, rdi
    xor r11, r11

myloop:
    cmp r11, rdx
    je exit
    mov [r8], sil
    inc r11
    inc r8
    jmp myloop

exit:
    mov rax, rdi
    leave
    ret