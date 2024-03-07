use strict;
use warnings;

print 'What\'s your name? '; # use single quotes when not interpolating

my $name = <STDIN>; # read from stdin

print "Hello, $name"; # string interpolation (requires ", not ')

