# $Id: DB.pm,v 1.1 2004-05-09 10:37:07 mitch Exp $
#
# DB routines for p0rn-proxy

my $db_env = new BerkeleyDB::Env { -Flags => BerkeleyDB::DB_INIT_CDB  };

sub opendb($)
{
    my %hash;
    
    my $table = shift;

    die "unkown table <$table>.  choose thumbz, picz or downz\n" unless (defined $table and ($table eq 'thumbz' or $table eq 'picz' or $table eq 'downz'));
    
    tie %hash, 'BerkeleyDB::Hash',
    { -Filename => 'p0rn.db',
      -Subname => $table,
      -Flags => BerkeleyDB::Hash::DB_CREATE
      };
    
    return \%hash;
}

1;
