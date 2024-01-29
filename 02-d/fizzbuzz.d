module fizzbuzz;

import std.stdio;

void main() {
    int start = 0;
    int end = 100;
    foreach(n; start..end) {
        if (n % 15 == 0) {
            writeln("FizzBuzz");
        } else if (n % 3 == 0) {
            writeln("Fizz");
        } else if (n % 5 == 0) {
            writeln("Buzz");
        }
    }
}
