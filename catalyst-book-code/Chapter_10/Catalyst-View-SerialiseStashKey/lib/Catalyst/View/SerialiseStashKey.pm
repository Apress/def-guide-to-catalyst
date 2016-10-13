 package Catalyst::View::SerialiseStashKey;

 use strict;
 use warnings;
 use parent qw( Catalyst::View );
 use YAML;

 __PACKAGE__->config( 'stash_key' => 'response');

 sub process {
 	my ($self, $c)= @_;
 	my $content = $self->render($c->stash);
  	$c->response->body($content);
 }

 sub render {
 	my ($self, $c) = @_;
        my $data = Load( $c->stash->{ $self->stash_key } );
 	my $content = "<pre>\n$data</pre>";
 	return $content;
 }

 1;
