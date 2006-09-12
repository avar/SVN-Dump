#!/usr/bin/perl
use strict;
use warnings;
use SVN::Dump;

my $file = shift;
my $dump = SVN::Dump->new( { file => $file } );

# compute some stats
my %type;
my %kind;
while ( my $record = $dump->next_record() ) {
    $type{ $record->type() }++;
    $kind{ $record->get_headers()->{'Node-action'} }++
        if $record->type() eq 'node';
}

# print the results
print "Dump $file statistics:\n",
      "  version:   ", $dump->version(), "\n",
      "  uuid:      ", $dump->uuid(), "\n",
      "  revisions: ", $type{revision}, "\n",
      "  nodes:     ", $type{node}, "\n";
print
      map { sprintf "  - %-7s: %d\n", $_, $kind{$_} } keys %kind;

