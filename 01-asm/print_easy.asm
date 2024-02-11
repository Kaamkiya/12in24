section         .data
        text    db      "Hello, World!", 10, 0  ; for this purpose, every string that we want to print terminates with a 0
        text2   db      "Goodbye, Mars!", 10, 0 ; this makes it easy to print strings with a subroutine

section         .text                           ; code section
        global  _start                          ; define entry point
_start:
        mov rax, text
        call _print

        mov rax, text2
        call _print

        mov rax, 60                             ; exit successfully
        mov rdi, 0
        syscall

_print:
        push rax                                ; push RAX on to the stack, to save the message to print for later
        mov rbx, 0                              ; set RBX to 0, as it'll be used for the print loop
_printloop:
        inc rax
        inc rbx                                 ; increment RBX, string length counter
        mov cl, [rax]                           ; move the character of the string in to CL
        cmp cl, 0                               ; is CL equal to 0?
        jne _printloop                          ; if no, continue looping

        mov rax, 1
        mov rdi, 1
        pop rsi                                 ; pop the string from the stack
        mov rdx, rbx                            ; string length count
        syscall
        ret
