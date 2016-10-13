use inc::Module::Install;

name     'Catalyst-View-SerialiseStashKey';
all_from 'lib/Catalyst/View/SerialiseStashKey.pm';
author   'Kieren Diment <zarquon@cpan.org>';
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

