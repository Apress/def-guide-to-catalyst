package MyApp::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

MyApp::Controller::Root - Root Controller for MyApp

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # now send an email instead of showing the welcome message
    $c->forward('/email');

    # then show the user a status page
    if ( scalar( @{ $c->error } ) ) {
        $c->error(0); # Reset the error condition if you need to
        $c->response->body('Oh noes!');
    } else {
        $c->response->body('Email sent A-OK! (At least as far as we can tell)');
    }
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub email : Private {
    my ( $self, $c ) = @_;

    my $to = 'alexander.hartmaier@t-systems.at';

    $c->stash->{email} = {
        to              => $to,
        from            => 'myapp@company.com',
        subject         => '[MyApp] notification',
        # if all of our mails contain plaintext and html we can
        # change the default content_type in the myapp.conf,
        # if not do it here per mail
        content_type    => 'multipart/alternative',
        templates   => [
            {
                template        => 'email.plain.tt',
                content_type    => 'text/plain',
                charset         => 'utf-8',
                # we might even specify a non-default view here
                view            => 'TT', 
            },
            {
                template        => 'email.html.tt',
                content_type    => 'text/html',
                charset         => 'utf-8',
            },
        ],
    };

    # now put data for the email body onto the stash
    $c->stash->{ip} = $c->req->address;

    # log the sending of the email
    $c->log->info("email sent to $to");

    $c->forward( $c->view('Email::Template') );
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Alexander Hartmaier,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
