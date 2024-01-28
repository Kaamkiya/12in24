module helloyou;

import std.stdio;
import std.string;

void main() {
    write("Hi! What's your name? ");
    string name = strip(stdin.readln());
    writefln("Hello, %s!", name);
}
