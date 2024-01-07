; A program that asks the user their name and tells them hello
; If you're reading this, I assume you've seen the Hello World program in ./hello.asm
; If not, go see that first

section         .data                                   ; variable section
        msg1    db      "Hi! What's your name? "        ; initialize the MSG1 variable to the string after it
        msg1len equ     $ - msg1                        ; this holds the `sizeof(msg1)`
        msg2    db      "Hello, "                       ; second string to print
        msg2len equ     $ - msg2                        ; memory size of MSG2

section         .bss                                    ; declare variables to be used later, without initializing
        name    resb    64                              ; reserve 64 bytes for the user's input

section         .text                                   ; code section
        global  _start                                  ; declare entry point...
_start:                                                 ; ... and add code to the program
        mov rax, 1                                      ; sys_write(
        mov rdi, 1                                      ;   STDOUT_FILENO, // write to stdout and not stderr
        mov rsi, msg1                                   ;   "Hi! What's your name?",
        mov rdx, msg1len                                ;   sizeof("Hi! What's your name?"),
        syscall                                         ; );

        mov rax, 0                                      ; set the function to read from stdin
        mov rdi, 0                                      ; so that the program reads from stdin and doesn't try to read from anything else
        mov rsi, name                                   ; parameter to reading. This is where input gets stored
        mov rdx, 64                                     ; this is the maximum size of the input given 
        syscall                                         ; and this calls the function

        mov rax, 1                                      ; set the function to write
        mov rdi, 1                                      ; so that we write to stdout
        mov rsi, msg2                                   ; what to write
        mov rdx, msg2len                                ; memory size of what to write
        syscall                                         ; and call the function

        mov rax, 1                                      ; this section prints the name
        mov rdi, 1
        mov rsi, name
        mov rdx, 64
        syscall

        mov rax, 60                                     ; and this section exits the program
        mov rdi, 0
        syscall
