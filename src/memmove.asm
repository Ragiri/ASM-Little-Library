bits 64

section .text

global memmove

memmove:
    push rbp
    mov rbp, rsp
    mov rax, rdi

cond_a:
    cmp rdi, rsi
    je exit
    jb cond_c
    mov r11, rsi
    add r11, rdx
    cmp rdi, r11
    jae cond_c

cond_b:
    std
    mov r11, rdx
    dec rdx
    add rsi, rdx
    add rdi, rdx
    rep movsb
    cld
    leave
    ret

cond_c:
    mov r11, rdx
    rep movsb

exit:
    leave
    ret