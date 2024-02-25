; This is an introduction to x86_64 assembly for linux
; Author: Kaamkiya <https://github.com/Kaamkiya>

; Prerequisites:
; - nasm compiler
; - ld linker
; - knowledge of C/C++ and other mid-level/low-level languages
; - patience (not joking, you actually need this)

; To compile x86_64 assembly:
;       $ nasm -f elf64 -o a.o <file>.asm
;       $ ld -o a.out a.o
; To run:
;       $ ./a.out


;;;;;;;;;;;;;;;;;;;;
; Hello World
;;;;;;;;;;;;;;;;;;;;

section         .data                           ; this is where variables are declared
        msg     db      "Hello, World!", 0xa    ; 0xa is a newline character, this is equal to const char* msg = "Hello, World!\n";
        msglen  equ     $ - msg                 ; this is the memory size of the msg variable, equal to sizeof(msg)

section         .text                           ; this is where the main code goes
        global  _start                          ; declare the entry point (*must* be _start)
_start:                                         ; define the entry point
        mov rax, 1                              ; RAX is the system call id. 1 means sys_write. This is called a register
        mov rdi, 1                              ; RDI is the first parameter for the function in RAX. This parameter is the file descriptor. This is another register
        mov rsi, msg                            ; RSI is the second function parameter for RAX. 
        mov rdx, msglen                         ; RDX is the third paramter, yet another register
        syscall                                 ; and now we call RAX with the parameters RDI, RSI, and RDX

        mov rax, 60                             ; 60 is exit, like how 1 is sys_write
        mov rdi, 0                              ; exit status success
        syscall                                 ; and execute

; an equivalent C program:
; #include <stdio.h>
; int main() {
;   const char* msg = "Hello, World!\n";
;   // sys_write(1, msg, sizeof(msg));
;   printf(msg);
;   return 0;
; }

; Keep this under your pillow: all the registers
; 64-bit register     lowest 23 bits      lowest 16 bits      lowest 8 bits
; rax                 eax                 ax                  al
; rbx                 ebx                 bx                  bl
; rcx                 ecx                 cx                  cl
; rdx                 edx                 dx                  dl
; rsi                 esi                 si                  sil
; rdi                 edi                 di                  dil
; rbp                 ebp                 bp                  bpl
; rsp                 esp                 sp                  spl
; r8                  r8d                 r8w                 r8b
; r9                  r9d                 r9w                 r9b
; r10                 r10d                r10w                r10b
; r11                 r11d                r11w                r11b
; r12                 r12d                r12w                r12b
; r13                 r13d                r13w                r13b
; r14                 r14d                r14w                r14b
; r15                 r15d                r15w                r15b
;
; 64-bit register means that that register stores 64 bits.
; For example, RAX stores 64 bits. EAX, however, stores the lowest 32 bits of
; RAX. AX stores the first 16 bits of RAX, and AL stores the first 8 bits of
; RAX. And so on (EBX is the first 32 bits of RBX, ...)


;;;;;;;;;;;;;;;;;;;;
; Data types
;;;;;;;;;;;;;;;;;;;;

section         .data                   ; again, variable initialization section
        int8    db      10              ; 8-bit  integer
        char    db      "K"             ; 8-bit  character
        strng   dw      "FUBAR"         ; 16-bit string
        i16     dw      5000            ; 16-bit integer
        i32     dd      786000          ; 32-bit integer
        pi      dd      3.14159         ; 32-bit float
        huge    dq      9999999999      ; 64-bit integer
        f128    dt      3.1415926535897 ; 128-bit float
        sysexit equ     60              ; equ is for constants
        stdout  equ     1               ; same as above

section         .bss                    ; this is where we declare uninitialized variables
        arr     resb    10              ; 10 element  byte array
        arr2    resw    50              ; 50 element  "word" array
        arr3    resd    100             ; 100 element "double" array
        arr4    resq    200             ; 200 element "quad" array

section         .text                   ; code section. Never forget the global start!
        global  _start
_start:
        mov rax, 1
        mov rdi, 1
        mov rsi, strng
        mov rdx, 100
        syscall

        mov rax, 1
        mov rdi, 1
        mov rsi, pi
        mov rdx, 100
        syscall

        mov rax, 60
        mov rdi, 0
        syscall
