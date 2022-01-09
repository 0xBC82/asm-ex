; EAT-SYS-CALL
; Use of Linux INT 80H syscalls to display text.

SECTION .data                   ; Section contains initialised data.
EatMsg: db "Initialised.",10
EatLen: equ $-EatMsg

SECTION .bss                    ; Section contains uninitialised data.
SECTION .text                   ; Section contains code.

global _start                   ; Entry point for linker.

_start:
    nop;                        ; @todo Explain
    mov eax,4                   ; Specify `sys_write` syscall.
    mov ebx,1                   ; Specify file descriptor to stdout.
    mov ecx,EatMsg              ; Pass message offset.
    mov edx,EatLen              ; Pass message length.
    int 80H                     ; Make syscall to output msg to stdout.

    mov eax,1                   ; Specify `exit` syscall.
    mov ebx,0                   ; Return 0 exit code.
    int 80H                     ; Make syscall to terminate program.
