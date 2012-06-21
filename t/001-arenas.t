use Test::More tests => 2;
use Test::Exception;

use_ok ('WR::XMLReader');

my $x = WR::XMLReader->new(filename => 't/data/arenas.xml');
my $d;

lives_ok { $d = $x->parse } 'parsing works';
