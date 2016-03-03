#!/usr/bin/perl

=head1 NAME 

Testing permissions to the file system

=cut

use strict;
use warnings;

use File::Temp;
use File::Touch;
use Test::More 'no_plan';


my $DEF_LOOP_COUNT = 500;
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
    for (my $i = 0; $i < $DEF_LOOP_COUNT; $i++) {
        print "$i ";
        chmod oct("0000"), $tmp_file;
        ok ! -r $tmp_file, "Can read";
        ok ! -w $tmp_file, "Can write";
        ok ! -x $tmp_file, "Can execute";
        chmod oct("0755"), $tmp_file;
        ok -r $tmp_file, "Can read";
        ok -w $tmp_file, "Can write";
        ok -x $tmp_file, "Can execute";
    }
};

ok( -r $etc_hosts, "Can read: $etc_hosts");
isnt( -w $etc_hosts, "Can't write: $etc_hosts");
isnt( -x $etc_hosts, "Can't execute: $etc_hosts");

ok( -r $etc_passwd, "readable: $etc_passwd");


