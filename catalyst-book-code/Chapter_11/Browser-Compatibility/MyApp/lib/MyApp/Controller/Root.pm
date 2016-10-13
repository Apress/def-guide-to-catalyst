 package MyApp::Controller::Root;

 use Moose;
 use namespace::autoclean;

 BEGIN { extends 'Catalyst::Controller'; }

 __PACKAGE__->config->{namespace} = '';

 sub index : Path Args(0) {
   my ($self, $c) = @_;
   $c->stash(things => [qw/
        affe
        tiger
        loewe
        birne
    /]);

   # template name automatically infered to be root/templates/index
 }

 sub default : Path {
     my ($self, $ctx) = @_;
     $ctx->response->body( 'Page not found' );
     $ctx->response->status(404);
 }

 sub end : ActionClass('RenderView') {}

 1;
