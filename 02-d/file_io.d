module file_io;

import std.stdio : writefln; // import *only* writefln from std.stdio
import std.file; // import specific things: only what we need

/**
 * we only import exactly what we need from each because the 
 * `write` function exists in std.stdio AND std.file.
 * if we imported both, D would throw an error
 */


void main(string[] args) {
	// get current directory
	writefln("This program is saved to %s", getcwd());

	// writing to a file
	string textfile = "/tmp/hello.txt";
	write(textfile, "Hello!");
	// reading from a file
	string contents = readText(textfile);
	writefln("The contents of " ~ textfile ~ " are:\n%s", contents);


	// exists checks if a file/folder already exists
	if (exists("/tmp/d_file_example")) {
		rmdirRecurse("/tmp/d_file_example"); // and this recursively deletes it if it does
	}
	// making directories
	mkdir("/tmp/d_file_example");
	// recursively making directories
	mkdirRecurse("/tmp/d_file_example/this/that/other/one_more");

	// switching into another directory
	chdir("/tmp/d_file_example/");
	write("./blah_blah_blah.txt", "Blah, ");
	foreach (_; 1..1000) {
		append("./blah_blah_blah.txt", "blah, ");
	}

}
