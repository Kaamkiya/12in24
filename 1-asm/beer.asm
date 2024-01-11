; Bottles of beer song
; Author: Kaamkiya <https:/github.com/Kaamkiya>
; Date:   2023.12.09 (yyyy.mm.dd)

section         .data
        msg1    db      " bottles of beer on the wall, "
        msg1len equ     $ - msg1
        msg2    db      " bottles of beer. Take one down, pass it around, "
        msg2len equ     $ - msg2
        msg3    db      " no more bottles of beer on the wall!", 10
        msg3len equ     $ - msg3
        newline db      10              ; 10 is the ID number for "\n"

section         .bss
        digits  resb    21              ; reserve 21 bytes. We will use this when printing the integer

section         .text
        global  _start
_start:
        mov r12, 99                     ; this is the counter
        mov r13, 0                      ; loop end

        loop:                           ; start the loop
                cmp r12, r13            ; is the counter equal to the maximum value?
                je tidy                 ; if yes, exit; otherwise, continue

                mov rax, r12
                call printNum
                
                mov rax, 1
                mov rdi, 1
                mov rsi, msg1
                mov rdx, msg1len
                syscall

                mov rax, r12            ; set the RAX register to the counter
                call printNum           ; print the appropriate value: Fizz, Buzz, FizzBuzz, or R12 

                mov rax, 1
                mov rdi, 1
                mov rsi, msg2
                mov rdx, msg2len
                syscall

                mov rax, 1
                mov rdi, 1
                mov rsi, newline
                mov rdx, 1
                syscall

                dec r12                 ; decrement the counter
                jmp loop                ; and continue the loop
        
        tidy:
                mov rax, 1
                mov rdi, 1
                mov rsi, msg3
                mov rdx, msg3len
                syscall

                mov rax, 60             ; exit(
                mov rdi, 0              ;   EXIT_SUCCESS
                syscall                 ; );

printNum:                               ; print a number. Currently only works for positive numbers
        mov r8, 20                      ; this holds the maximum length of the number
        mov r9, 10                      ; we will be dividing by ten repeatedly

        divloop:
                xor rdx, rdx            ; calculate ASCII value of last digit of RAX
                div r9                  ; divide RAX by R9 (R9 is 10)
                add rdx, '0'

                mov byte [digits + r8], dl
                dec r8
                cmp rax, 0               ; RAX == 0?
                jne divloop              ; if no, continue looping

        inc r8
        mov rax, 1
        mov rdi, 1
        lea rsi, [digits + r8]
        mov rdx, 21
        sub rdx, r8
        syscall
        ret

