use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    dist_name       => 'TestPerms',
    dist_abstract   => 'Long Description',
    dist_version    => '0.1',
    dist_author     => 'Ruslan K <free.changer@gmail.com>',
);

$builder->create_build_script();
