#!/usr/bin/perl
#===============================================================================
#
#         FILE:  linear_regression.pl
#
#        USAGE:  ./linear_regression.pl
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
#      CREATED:  03/05/2013 04:49:33 AM
#     REVISION:  ---
#===============================================================================

use Statistics::Regression;
use strict;
use warnings;

my $reg=Statistics::Regression->new("Title", ["Intercept", "Slope"]);

#the use of 1.0 in the includes allows for the computation of a y intercept
$reg->include(1.3, [1.0, 1.0]);
$reg->include(2.9, [1.0, 2.0]);
$reg->include(4.2, [1.0, 3.0]);
$reg->include(5.4, [1.0, 4.0]);

$reg->print;
