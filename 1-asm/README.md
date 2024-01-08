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

---

Notice that the executable for Hello World is smaller than the program itself.
Now try making Hello World, then find it's size. The Rust compiler generates a
gigantic executable comparatively. This is because Assembly is the *closest* a
human can get to machine code while still using normal letters. That lets it 
make tiny executables, even if the programs are much longer. 
