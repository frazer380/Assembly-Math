STDIN equ 2
STDOUT equ 1

section .data
    txt1 db "Enter number 1: "
    txt1len equ $ - txt1
    txt2 db "Enter number 2: "
    txt2len equ $ - txt2
    txt3 db "Sum: "
    txt3len equ $ - txt3

section .bss
    num1 resb 2
    num2 resb 2
    ans resb 1

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, STDOUT
    mov rsi, txt1
    mov rdx, txt1len
    syscall

    mov rax, 0
    mov rdi, STDIN
    mov rsi, num1
    mov rdx, 2
    syscall

    mov rax, 1
    mov rdi, STDOUT
    mov rsi, txt2
    mov rdx, txt2len
    syscall

    mov rax, 0
    mov rdi, STDIN
    mov rsi, num2
    mov rdx, 2
    syscall

    mov rax, 1
    mov rdi, STDOUT
    mov rsi, txt3
    mov rdx, txt3len
    syscall

    mov eax, [num1]         ; set eax register to the input 1 value
    sub eax, "0"            ; subtracting ascii "0" will convert it into a decimal number

    mov ebx, [num2]
    sub ebx, "0"

    add eax, ebx
    add eax, "0"

    mov [ans], eax

    mov rax, 1
    mov rdi, STDOUT
    mov rsi, ans
    mov rdx, 1
    syscall

    mov rax, 60
    mov rdi, 0
    syscall