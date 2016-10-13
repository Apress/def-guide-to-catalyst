#!/usr/bin/env perl

use warnings;
use strict;
use Template;

my $template = Template->new();
my @dwarfs = qw/Bashful Doc Dopey Grumpy Happy Sleepy Sneezy/;
my $cgi_stash = {
    title   => "Howdy!",
    message => "Hello World!",
    dwarfs  => \@dwarfs,
};

$template->process(\*DATA, $cgi_stash);

__DATA__
Content-Type: text/html; charset=ISO-8859-1

<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" xml:lang="en-US">
<head>
<title>[% title %]</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<body>
<h1>[% message %]</h1>
<ul>
[%- FOREACH dwarf IN dwarfs -%]
<li>[% dwarf; IF dwarf != dwarfs.last %] and [% END -%]</li>
[%- END %].
</body>
</html>
