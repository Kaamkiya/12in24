; FizzBuzz in x86_64 Intel Assembly
; Author: Kaamkiya <https:/github.com/Kaamkiya>
; Date:   2023.12.09 (yyyy.mm.dd)

section         .data
        fizz    db      "Fizz"          ; declare the `fizz' variable to hold the string "Fizz"
        fizzlen equ     $ - fizz        ; size of `fizz' variable in bytes
        buzz    db      "Buzz"          ; declare the `buzz' variable containing the string "Buzz"
        buzzlen equ     $ - buzz        ; size of `buzz' variable in bytes
        newline db      10              ; 10 is the ID number for "\n"

section         .bss
        digits  resb    21              ; reserve 21 bytes. We will use this when printing the integer

section         .text
        global  _start
_start:
        mov r12, 1                      ; this is the counter
        mov r13, 1000                   ; loop end

        loop:                           ; start the loop
                cmp r12, r13            ; is the counter equal to the maximum value?
                je exit                 ; if yes, exit; otherwise, continue
                
                mov rax, r12            ; set the RAX register to the counter
                call printNum           ; print the appropriate value: Fizz, Buzz, FizzBuzz, or R12 

                mov rax, 1              ; stdout
                mov rdi, 1              ; stdout
                mov rsi, newline        ; to print the new line
                mov rdx, 1              ; size of newline
                syscall                 ; and go

                inc r12                 ; increment the counter
                jmp loop                ; and continue the loop
        
        exit:
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

