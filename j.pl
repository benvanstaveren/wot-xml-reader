#!/usr/bin/perl
use strict;
use warnings;
use lib qw{./lib};
use WR::XMLReader;
use JSON::XS;

my $file = $ARGV[0];
my $out  = $ARGV[1] || '-';
my $fn   = (split(/\//, $file))[-1];

print 'file: ', $file, 'node: ', $fn, "\n";
my $x = WR::XMLReader->new(filename => $ARGV[0]);

my $j = JSON::XS->new->pretty->allow_blessed(1)->convert_blessed(1);
if($out ne '-') {
    if(my $fh = IO::File->new(sprintf('>%s', $out))) {
        $fh->print($j->encode($x->parse));
        $fh->close;
    }
} else {
    print $j->encode($x->parse);
}
