# $Id: DB.pm,v 1.4 2004-05-26 08:57:41 mitch Exp $
#
# DB routines for p0rn-comfort
#
# 2004 (C) by Christian Garbs <mitch@cgarbs.de>
# Licensed under GNU GPL.  See COPYING for details.

use DBM::Deep;

my $dblocation = './p0rn.db';
$dblocation = $ENV{P0RNDBLOCATION} if exists $ENV{P0RNDBLOCATION};

my $db = new DBM::Deep(
		       file => $dblocation,
		       mode => 'r+',
		       type => DBM::Deep::TYPE_HASH,
		       locking => 1,
		       autoflush => 1
		       );

die "can't open database `$dblocation', perhaps it's an old v0.0.2 Berkeley DB file?\n" unless defined $db;

sub opendb($)
{
    my $table = shift;
    die "unkown table <$table>.  choose thumbz, picz or downz\n" unless (defined $table and ($table eq 'thumbz' or $table eq 'picz' or $table eq 'downz'));
    $db->put($table, {}) unless ($db->exists($table));
    return $db->get($table);
}

1;
