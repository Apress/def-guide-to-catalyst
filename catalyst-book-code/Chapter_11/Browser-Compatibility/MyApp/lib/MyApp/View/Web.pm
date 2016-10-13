package MyApp::View::Web;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(TEMPLATE_EXTENSION => '.tt',
                    WRAPPER            => 'page.tt',
                );

=head1 NAME

MyApp::View::Web - TT View for MyApp

=head1 DESCRIPTION

TT View for MyApp. 

=head1 AUTHOR

=head1 SEE ALSO

L<MyApp>

Kieren Diment

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
