#!/usr/bin/perl
use strict;
use warnings;
use lib qw{./lib};
use WR::XMLReader;
use JSON::XS;

my $path = $ARGV[0];
my $n    = $ARGV[1];
my $out  = $ARGV[2];

my $j = JSON::XS->new->pretty->allow_blessed(1)->convert_blessed(1);
foreach my $type (qw/chassis engines fueltanks guns radios shells turrets/) {
    my $infile = sprintf('%s/%s.xml', $path, $type);
    my $x = WR::XMLReader->new(filename => $infile);
    my $fh = IO::File->new(sprintf('>%s/%s_%s.json', $out, $n, $type));
    $fh->print($j->encode($x->parse));
    $fh->close;
}
