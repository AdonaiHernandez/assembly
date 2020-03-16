section .bss
    entrada: resb 1
    salida: resb 2

section .text

global _start

_start:

    mov eax, 3
    mov ebx, 0
    mov ecx, entrada
    mov edx, 1
    int 80h

    mov al, [entrada]
    mov ah, 0xA

    mov [salida], ax

    mov edx, 2
    mov ecx, salida

    call print_int

    mov eax, 1
    mov ebx, 0
    int 0x80

print_int:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret    
