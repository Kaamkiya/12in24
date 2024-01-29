module helloyou;

import std.stdio;
import std.string;

void main() {
    write("Hi! What's your name? "); // writing without a newline
    string name = strip(stdin.readln()); // reading input and assigning to a variable
    writefln("Hello, %s!", name); // writing output with formatting
}
