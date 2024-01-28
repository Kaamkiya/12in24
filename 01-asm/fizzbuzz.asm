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
                call printVal           ; print the appropriate value: Fizz, Buzz, FizzBuzz, or R12 

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

printVal:
        push r12                        ; add R12 and R13 to the stack
        push r13

        xor r12, r12                    ; flag whether Fizz or Buzz was printed
        mov r13, rax                    ; keep a copy of the input to use

        testFizz:
                xor rdx, rdx
                mov r8,  3              ; set R8 to 3
                div r8                  ; divide RDX by 3
                cmp rdx, 0              ; is RDX equal to 0?
                jne testBuzz            ; if no, skip to testing if the number is divisible by 5

                mov rax, 1              ; sys_write(
                mov rdi, 1              ;   STDOUT_FILENO,
                mov rsi, fizz           ;   "Fizz",
                mov rdx, fizzlen        ;   sizeof("Fizz")
                syscall                 ; );

                inc r12                 ; mark that a word was printed for this number

        testBuzz:
                mov rax, r13

                xor rdx, rdx            ; same as the `testFizz' subroutine, but check for 5 instead of 3
                mov r8, 5
                div r8
                cmp rdx, 0
                jne testNum             ; and then skip to the `testNum' subroutine

                mov rax, 1              ; sys_write(
                mov rdi, 1              ;   STDOUT_FILENO,
                mov rsi, buzz           ;   "Buzz",
                mov rdx, buzzlen        ;   sizeof("Buzz")
                syscall                 ; );

                inc r12                 ; mark that something was printed for the current number

        testNum:
                cmp r12, 0              ; was a word printed for this number?
                jne cleanup             ; if yes, skip to cleanup; else, continue

                mov rax, r13            ; restore original input
                call printNum           ; print the contents of the RAX register

        cleanup:
                pop r13                 ; pop from the stack into R13
                pop r12                 ; we push them into the stack at the start, this is just restoring the to the original values
                ret                     ; and return to main routine
