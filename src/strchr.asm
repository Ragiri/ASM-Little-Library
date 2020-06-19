BITS 64

section .text

GLOBAL strchr 

strchr:
    push rbp
    mov rbp, rsp
    xor r11, r11

cond_a:
    cmp byte[rdi], sil
    je exit
    cmp byte[rdi], 0
    je exit_bis
    inc rdi
    jmp cond_a

exit:
    mov rax, rdi
    leave
    ret

exit_bis:
    mov rax, 0
    leave
    ret