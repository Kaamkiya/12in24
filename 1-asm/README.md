# January: x86-64 Assembly

In January, I worked with Assembly. Specifically, x86 64-bit Intel-flavoured
Assembly. 

Compile a program:

```bash
nasm -f elf64 -o a.o <file>.asm # create an object file for the program
ld -o a.out a.o			# create an executable for the project
rm a.o                          # optional: remove the object file (it's useless)
```

Run the compiled program:
```bash
./a.out
```

If you compiled to something other than a.out, like a.exe, enter the path to
that instead.

This is by far the hardest language in this repo, so definitely don't start
with it. Pick something easier, like COBOL. 

## Some Simple Concepts

`section`: this declares the section you are working with. 
`section .data` means you are working with variables, and `section .text` is
where all of the program code goes. 

`mov x, y`: moves x into y (`x = y`)
`add x, y`: adds x and y and moves it in to x (`x += y`)
`mul x, y`: multiplies x and y and puts it in x (`x *= y`)
