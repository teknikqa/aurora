use strict;
use warnings;

use DBI;

# DB settings
my $host = "localhost" ;
my $database = "..." ;
my $user = "..." ;
my $password = "..." ;

my $dbh = DBI->connect("DBI:mysql:$database",
                       "$user",
                       "$password")
    || die "Could not connect to database: $DBI::errstr";

my $qpwd = $dbh->quote($ENV{'PWD'}) ;

# Cut all counts in half:
$dbh->do("UPDATE dircounts SET count = count/2");

$dbh->disconnect();
