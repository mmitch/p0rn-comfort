# $Id: DB.pm,v 1.3 2004-05-14 20:51:38 mitch Exp $
#
# DB routines for p0rn-comfort
#
# 2004 (C) by Christian Garbs <mitch@cgarbs.de>
# Licensed under GNU GPL.  See COPYING for details.

my $db_env = new BerkeleyDB::Env { -Flags => BerkeleyDB::DB_INIT_CDB  };

sub opendb($)
{
    my %hash;
    
    my $table = shift;

    die "unkown table <$table>.  choose thumbz, picz or downz\n" unless (defined $table and ($table eq 'thumbz' or $table eq 'picz' or $table eq 'downz'));

    my $dblocation = './p0rn.db';
    $dblocation = $ENV{P0RNDBLOCATION} if exists $ENV{P0RNDBLOCATION};
    
    tie %hash, 'BerkeleyDB::Hash',
    { -Filename => $dblocation,
      -Subname => $table,
      -Flags => BerkeleyDB::Hash::DB_CREATE
      };
    
    return \%hash;
}

1;
