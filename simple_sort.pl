#!/usr/bin/perl
#===============================================================================
#
#         FILE:  sort.pl
#
#        USAGE:  ./sort.pl
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
#      CREATED:  03/05/2013 05:17:24 AM
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;

sub bubblesort
{
    my $array = shift;

    my $i;         # The initial index for the bubbling scan.
    my $j;         # The running index for the bubbling scan.
    my $ncomp = 0; # The number of comparisons.
    my $nswap = 0; # The number of swaps.

    for ( $i = $#$array; $i; $i-- )
    {
        for ( $j = 1; $j <= $i; $j++ )
        {
            $ncomp++;
            # Swap if needed.
            if ( $array->[ $j - 1 ] gt $array->[ $j ] )
            {
                @$array[ $j, $j - 1 ] = @$array[ $j - 1, $j ];
                $nswap++;
            }
        }
    }

    print "bubblesort:  ", scalar @$array," elements, $ncomp comparisons, $nswap swaps\n";
}

use constant BUCKET_SIZE => 10;

sub bucket_sort
{
    my ($array, $min, $max) = @_;
    my $N = @$array or return;

    my $range    = $max - $min;
    my $N_BUCKET = $N / BUCKET_SIZE;
    my @bucket;

    # Create the buckets.
    for ( my $i = 0; $i < $N_BUCKET; $i++ )
    {
        $bucket[ $i ] = [ ];
    }

    # Fill the buckets.
    for ( my $i = 0; $i < $N; $i++ )
    {
        my $bucket = $N_BUCKET * (($array->[ $i ] - $min)/$range);
        push @{ $bucket[ $bucket ] }, $array->[ $i ];
    }

    # Sort inside the buckets.
    for ( my $i = 0; $i < $N_BUCKET; $i++ )
    {
        insertion_sort( $bucket[ $i ] );
    }

    # Concatenate the buckets.
    @{ $array } = map { @{ $_ } } @bucket;
}

sub insertion_sort
{
    my $array = shift;

    my $i;      # The initial index for the minimum element.
    my $j;      # The running index for the minimum-finding scan.

    for ( $i = 0; $i < $#$array; $i++ )
    {
        my $m = $i; # The final index for the minimum element.
        my $x = $array->[ $m ]; # The minimum value.

        for ( $j = $i + 1; $j < @$array; $j++ )
        {
            # Update minimum.
            ( $m, $x ) = ( $j, $array->[ $j ] )
                if $array->[ $j ] lt $x;
        }

        # The double-splice simply moves the $m-th element to be
        # the $i-th element.  Note: splice is O(N), not O(1).
        # As far as the time complexity of the algorithm is concerned
        # it makes no difference whether we do the block movement
        # using the preceding loop or using splice().  Still, splice()
        # is faster than moving the block element by element.
        splice @$array, $i, 0, splice @$array, $m, 1 if $m > $i;
    }
}



