#!/usr/bin/perl

use strict;
use warnings;

use DBI;

# DB settings
my $host = "localhost" ;
my $database = "stargazer" ;
my $user = "root" ;
my $password = "ipe83" ;

my $dbh = DBI->connect("DBI:mysql:$database",
                       "$user",
                       "$password")
    || die "Connection failed: $DBI::errstr";

my $qpwd = $dbh->quote($ENV{'PWD'}) ;

$dbh->do("INSERT INTO dircounts(path,count) ".
              "VALUES ($qpwd,1) ".
           "ON DUPLICATE KEY UPDATE count=count+1") ;

$dbh->disconnect();
