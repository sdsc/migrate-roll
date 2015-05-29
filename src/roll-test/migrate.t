#!/usr/bin/perl -w
# migrate roll installation test.  Usage:
# migrate.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/migrate';
my $output;
my @TYPES = ("3.6.8","3.6.10");


my $TESTFILE = 'tmpmigrate';

if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'migrate installed');
} else {
  ok(! $isInstalled, 'migrate not installed');
}
SKIP: {

  skip 'migrate not installed', 4 if ! $isInstalled;

  foreach my $VERS(@TYPES)  {
     `mkdir $TESTFILE.dir`;
     $output = `module load ROLLCOMPILER; module load ROLLMPI; module load migrate/${VERS};cd $TESTFILE.dir;cp /opt/migrate/${VERS}/example/parmfile* .;cp /opt/migrate/${VERS}/example/infile.msat .;mpirun -np 5 migrate-n-mpi parmfile.testbayes -nomenu 2>&1`;
     like($output, qr/1             -12825.04/, 'migrate $VERS runs');
     `rm -rf  $TESTFILE.dir`;
  }
  `/bin/ls /opt/modulefiles/applications/migrate/[0-9]* 2>&1`;
  ok($? == 0, 'migrate module installed');
  `/bin/ls /opt/modulefiles/applications/migrate/.version.[0-9]* 2>&1`;
  ok($? == 0, 'migrate version module installed');
  ok(-l '/opt/modulefiles/applications/migrate/.version',
     'migrate version module link created');

}

`rm -fr $TESTFILE*`;
