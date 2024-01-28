; Hello World in Assembly
; See README for compilation instructions

section         .data
        msg     db      "Hello, World!", 10     ; declare a message variable containing "Hello, World!\n"
        msglen  equ     $ - msg                 ; declare a variable containing `sizeof(msg)`

section         .text                           ; code section
        global  _start                          ; declare entry point (similar to `int main();`)
_start:                                         ; define entry point (the contents of `int main`)
        mov rax, 1                              ; set the command to `sys_write`
        mov rdi, 1                              ; set the file descriptor (where to affect by `sys_write`-ing) to stdout
        mov rsi, msg                            ; think of this as a parameter to `sys_write`
        mov rdx, msglen                         ; think of this as another parameter 
        syscall                                 ; and this calls the specified function

        mov rax, 60                             ; set the action to exit
        mov rdi, 0                              ; exit status (0 means success)
        syscall                                 ; call the exit function, ending execution

; An equivalent C program:
; 
; #include <stdio.h>
; int main() {
;   printf("Hello, World!\n");
;   return 0;
; }
