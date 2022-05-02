#!/usr/bin/perl

## EXAMPLE:
## table-from-view.pl entailed_subclass_of_edge | sqlite3 db/uberon-ext.db

my $n = shift @ARGV;

print "CREATE TABLE tmp_$n AS SELECT * FROM $n; ";
print "DROP VIEW $n; ";
print "CREATE TABLE $n AS SELECT * FROM tmp_$n; ";
print "\n";

