#!/usr/bin/perl
#===============================================================================
#
#         FILE:  perl_stats.pl
#
#        USAGE:  ./perl_stats.pl
#
#  DESCRIPTION:
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  YOUR NAME (),
#      COMPANY:
#      VERSION:  1.0
#      CREATED:  03/05/2013 05:01:41 AM
#     REVISION:  ---
#===============================================================================

use Statistics::Descriptive;
use strict;
use warnings;

#generate 100 random numbers between 50 and 150
my $range=101;
my $minimum=50;
my @randnums = map { int(rand($range)+$minimum) } ( 1..100 );

#prints the random numbers
#to prove the random number generation worked
foreach my $randnum (@randnums)
{
    print "$randnum\n";
}

#computes basic statistics on data
my $stat=Statistics::Descriptive::Full->new();
$stat->add_data(@randnums);

my $mean=$stat->mean();
print "The mean is: $mean\n";

my $median=$stat->median();
print "The median is: $median\n";

my $mode=$stat->mode();
print "The mode is: $mode\n";

my $sd=$stat->standard_deviation();
print "The standard deviation is: $sd\n";

my $min=$stat->min();
print "The minimum is: $min\n";

my $max=$stat->max();
print "The maximum is: $max\n";
