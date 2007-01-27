#!/usr/bin/perl -w

use OWNet ;

my $ow = OWNet->new('-v 3000') ;

sub Dirlist($) {
  my $fil = shift ;
  print "$fil\t" ;
  my $val = $ow->read($fil) ;
  if ( defined($val) ) { 
    print "$val\n"; 
    return ;
  } 
  print "Directory\n" ; 
  my @dir = split /,/ ,  $ow->dir($fil) ;
  foreach (@dir) {
     Dirlist($_) ;
  }
  return ;
}

Dirlist('/') ;
