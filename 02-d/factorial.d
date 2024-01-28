import std.stdio;
import std.conv;

int fact(int n) {
  if (n < 2) return 1;
  return fact(n-1)*n;
}

void main() {
		write("Enter a number to find the factorial of: ");
		int number = std.conv.to!int(readln());
		writeln(fact(number));
}
