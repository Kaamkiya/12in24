use strict;
use warnings;

my $start = 0;
my $end = 100;

# loops $i from 0 to 100
for my $i ($start .. $end) {
  if ($i % 15 == 0) {
    print "FizzBuzz\n";
  } elsif ($i % 5 == 0) {
    print "Fizz\n";
  } elsif ($i % 3 == 0) {
    print "Buzz\n";
  } else {
    print "$i\n";
  }
} 
