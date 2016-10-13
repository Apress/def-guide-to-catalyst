 package MyApp::Controller::Root;
 use strict;
 use warnings;

 __PACKAGE__->config(namespace => '');


 use parent 'Catalyst::Controller::reCAPTCHA';

 sub index :Private {
     my ($self, $c) = @_;
     $c->forward('captcha_get');
     my $recaptcha = $c->stash->{recaptcha};
     my $recaptcha_ok = $c->stash->{recaptca_ok};
     my $recaptcha_error = $c->stash->{recaptcha_error};
     my $check_uri = $c->uri_for('/check');

     my $body = <<EOF;
     <html><body>
      <p> recaptcha error:  $recaptcha_error </p>
      </p><form name="recaptcha" action="$check_uri"
           method="post"> $recaptcha <br/>
      <input type="submit" value="submit" /> </form>
EOF
     $c->res->body($body);
 }

 sub check : Local {
     my ($self, $c) = @_;
     if ($c->forward('captcha_check')) {
         $c->detach('ok')
     }
     else {
         $c->detach('index');
     }
 }

 sub ok : Private {
    my ($self, $c) = @_;
    $c->res->body('You appear to be human');
 }
 1;
