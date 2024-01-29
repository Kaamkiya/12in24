module factorial;

import std.stdio;
import std.conv;

int fact(int n) { // new function! a lot like c
    if (n < 2) return 1;
    return fact(n-1) * n;
}

void main() {
    write("Enter a number to find the factorial of: ");
    int number = std.conv.to!int(readln()); // read user input and convert it to int
    writeln(fact(number));
}
