module guessnumber;

import std.stdio;
import std.conv : to;
import std.string : strip;
import std.random : uniform;

void main(string[] args) {
	const int number = uniform(1, 100); // uniform generates a random number between a and b
	int guess;

	writeln("I'm thinking of a number between 1 and 100. Can you guess it?");
	while (true) { // infinite guesses. Can you implement a version with limited guesses?
		guess = to!int(strip(readln())); // take input, strip whitespace, convert to integer
		if (guess < number) {
			writeln("Too small!");
		} else if (guess > number) {
			writeln("Too big!");
		} else {
			break;
		}
	}

	writeln("Correct! You win :)");
}
