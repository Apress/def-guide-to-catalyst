#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Catalyst::View::SerialiseStashKey' );
}

diag( "Testing Catalyst::View::SerialiseStashKey $Catalyst::View::SerialiseStashKey::VERSION, Perl $], $^X" );
