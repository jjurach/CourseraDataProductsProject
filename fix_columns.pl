#!/usr/bin/perl -w
use strict;

=xxx

Anderson Mill Tavern,78750,09/16/2014,97,"10401 ANDERSON MILL RD Unit 121
AUSTIN, TX 78750
(30.44711291300007, -97.80562073799996)",10485330,Routine Inspection

=cut

my @fields = qw(name zipcode inspection_date score address city state lat lon facility_id description);

my @out;
my $cur;

while (<>) {
  s/\s+$//;
  if (/^(.*),(\d+),(\d+\/[^,]+),(\d+),"(.*)$/) {
    push @out, ($cur = {
        name => $1,
        zipcode => $2,
        inspection_date => $3,
        score => $4,
        address => $5,
      });
  } elsif (/^([^,]+), \w\w (\d+)$/) {
    $cur->{city} = $1;
    $cur->{state} = $2;
    $cur->{zipcode2} = $3;
  } elsif (/^\(([\-0-9\.]+), ([\-0-9\.]+)\)",(\d+),(.*)$/) {
    $cur->{lat} = $1;
    $cur->{lon} = $2;
    $cur->{facility_id} = $3;
    $cur->{description} = $4;
  } else {
    warn("Unrecognized: [$_]");
  }
}

print join(",", @fields)."\n";
for my $rec (@out) {
  print join(",", @{$rec}{@fields})."\n";
}

