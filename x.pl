#!/usr/bin/perl
use strict;
use warnings;
use lib qw{./lib};
use WR::XMLReader;
use XML::Simple;

my $file = $ARGV[0];
my $out  = $ARGV[1] || '-';
my $fn   = (split(/\//, $file))[-1];

print 'file: ', $file, 'node: ', $fn, "\n";
my $x = WR::XMLReader->new(filename => $ARGV[0]);

if($out ne '-') {
    if(my $fh = IO::File->new(sprintf('>%s', $out))) {
        $fh->print(XMLout($x->parse));
        $fh->close;
    }
} else {
    print XMLout($x->parse);
}
