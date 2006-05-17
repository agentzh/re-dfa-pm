#!perl
#: re2nfa.pl
#: regex -> NFA converter
#: Copyright (c) 2006 Agent Zhang
#: 2006-05-17 2006-05-17

use strict;
use warnings;

use Getopt::Std;
use re::NFA;

my %opts;
getopts('h', \%opts);

if ($opts{h}) {
    Usage(0);
}

if (! @ARGV) {
    Usage(1);
}

sub Usage {
    my $code = shift;
    my $msg = "Usage: re2nfa [-h] <regex>\n";
    if ($code == 0) {
        print $msg;
        exit(0);
    } else {
        warn $msg;
        exit($code);
    }
}

my $regex = shift;

my $outfile = 'NFA.png';
if (re::NFA::translate($regex, $outfile)) {
    print "$outfile generated.\n";
} else {
    exit(1);
}