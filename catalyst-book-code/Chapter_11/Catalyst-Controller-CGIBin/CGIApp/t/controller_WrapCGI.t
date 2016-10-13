use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'CGIApp' }
BEGIN { use_ok 'CGIApp::Controller::WrapCGI' }

ok( request('/wrapcgi')->is_success, 'Request should succeed' );


