# $Id: DB.pm,v 1.7 2005-10-29 17:40:11 mitch Exp $
#
# DB routines for p0rn-comfort
#
# 2004 (C) by Christian Garbs <mitch@cgarbs.de>
# Licensed under GNU GPL.  See COPYING for details.

use strict;
use DBI;

sub opendb()
{
    return DBI->connect(
			'DBI:mysql:database=p0rndb;host=localhost;port=3306',
			'p0rndb',
			'p0rndb',
			{'PrintError' => 1,
			 'PrintWarn' => 1,
			 'ShowErrorStatement' => 1}
#		       {'RaiseError' => 1}
			);
}

sub geturi($$)
{
    my ($dbh, $url) = @_;

    my $ret = {};
    my $sth = $dbh->prepare('SELECT * FROM URLs WHERE url = '.$dbh->quote($url));
    $sth->execute();
    while (my $ref = $sth->fetchrow_hashref()) {
	$ret = $ref;
    }

    return $ret;
}

sub deleteuri($$)
{
    my ($dbh, $url) = @_;
    $dbh->do('DELETE FROM URLs WHERE url = '.$dbh->quote($url).'');
}

sub getdate()
{
    my (undef,undef,undef,$mday,$mon,$year,undef,undef,undef) =
		       gmtime(time);
    return sprintf("%04d-%02d-%02d", 1900+$year, $mon+1, $mday);
}

sub inserturi($$$$$)
{
    my ($dbh, $url, $type, $status, $visits) = @_;
    my $date = getdate();
    my $cmd = sprintf('INSERT INTO URLs VALUES (%s, %s, %s, %s, %s, %s)', $dbh->quote($url), $dbh->quote($date), $dbh->quote($date), $status, $type, $visits);
    $dbh->do($cmd);
}

sub updateuri($$$$$)
{
    my ($dbh, $url, $type, $status, $visits) = @_;
    my $date = getdate();
    my $cmd = sprintf('UPDATE URLs SET changed = %s, status = %s, type = %s, visits = %s WHERE url = %s', $dbh->quote($date), $status, $type, $visits, $dbh->quote($url));
    $dbh->do($cmd);
}

sub seturi($$@)
{
    my ($dbh, $url, $type, $status, $visits) = @_;
    $type   = -1 unless defined $type;
    $status = -1 unless defined $status;
    $visits = -1 unless defined $visits;
    my $old = geturi($dbh, $url);
    if (exists $old->{url}) {
	$type   = $old->{type}   if $type   == -1;
	$status = $old->{status} if $status == -1;
	updateuri($dbh, $url, $type, $status, $visits);
    } else {
	$status = 1 if $status == -1;
	inserturi($dbh, $url, $type, $status, $visits);
    }
}

1;
