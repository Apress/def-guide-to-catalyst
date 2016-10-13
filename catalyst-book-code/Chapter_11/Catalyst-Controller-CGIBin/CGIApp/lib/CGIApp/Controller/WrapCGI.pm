package CGIApp::Controller::WrapCGI;

use strict;
use warnings;
use parent 'Catalyst::Controller::WrapCGI';
use FindBin qw/$Bin/;

sub serve_cgi :Path :Args(1) {
    my ($self, $c, $file) = @_;
    $self->cgi_to_response($c, sub {
        system ($^X, $c->path_to("root/cgi-bin/$file") );
    });
}

1;
