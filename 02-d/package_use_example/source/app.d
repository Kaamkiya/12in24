import core.thread : Thread;
import core.time : msecs;

import sily.logger;
import sily.bashfmt;

void main(string[] args) {
	center("This is centered with sily.logger.center");
	
	hr(); // horizontal rule across the screen

	// code block
	block("Hello World in D", "import std.stdio;\n\nvoid main(string[] args) {\n    writeln(\"Hello, World!\");\n}");
	
	auto progressBar = new ProgressBar("Percent done");
	int incrementer = 1;
	for (int i = 0; i <= 100; i += incrementer) {
		progress(*progressBar);
		Thread.sleep(67.msecs);
		progressBar.advance(incrementer);
		if (i != 100) eraseLines(2);
	}
	
	printCompilerInfo();
	
	hr('▒', "Cool, right?", "\033[38;5;52m", "\033[48;5;52m\033[38;5;11m");
}
