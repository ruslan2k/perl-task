#!/usr/bin/perl

use strict;
use warnings;

use File::Temp;
use File::Touch;
use Test::More 'no_plan';

my $etc_hosts = '/etc/hosts';
my $etc_passwd = '/etc/passwd';
my $tmp_dir = '/tmp';
my $tmp_file = '/tmp/test-file';

BEGIN {
    use_ok('File::Touch');
    use_ok('File::Temp');
}

subtest 'Test execute permission' => sub {
    my $count = touch($tmp_file);
    ok $count == 1, 'Create tmp file';
    chmod oct("0755"), $tmp_file;
    ok -x $tmp_file, "Can execute";
};

ok( -r $etc_hosts, "Can read: $etc_hosts");
isnt( -w $etc_hosts, "Can't write: $etc_hosts");
isnt( -x $etc_hosts, "Can't execute: $etc_hosts");

ok( -r $etc_passwd, "readable: $etc_passwd");


