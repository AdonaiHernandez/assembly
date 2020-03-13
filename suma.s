section .bss
    num1 resb 1
    num2 resb 1
    sum resb 2

section .text

global _start

_start:

    mov byte [num1], '1'
    mov byte [num2], '2'

    mov al, [num1]
    mov bl, [num2]
    sub al, '0'
    sub bl, '0'
    add al, bl

    add al, '0'

    mov [sum], al

    mov edx, 2
    mov ecx, sum

    call print_int

    mov eax, 1
    mov ebx, 0
    int 0x80

print_int:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret
