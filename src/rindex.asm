BITS 64

section .text

GLOBAL rindex

rindex:
    push rbp
    mov rbp, rsp
    xor r11, r11

myloop:
    cmp byte [rdi], 0
    je cond_a
    inc rdi
    inc r11
    jmp myloop

cond_a:
    cmp byte[rdi], sil
    je exit
    cmp r11, 0
    je exit_bis
    dec rdi
    dec r11
    jmp cond_a

exit:
    mov rax, rdi
    leave
    ret

exit_bis:
    mov rax, 0
    leave
    ret