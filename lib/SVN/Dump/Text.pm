package SVN::Dump::Text;

use strict;
use warnings;

my $NL = "\012";

# blessed string reference
sub new {
    my ( $class, @args ) = @_;
    return bless \( join '', @args ), $class;
}

sub set {
    my ( $self, $text ) = @_;
    $$self = $text;
}
sub get { ${ $_[0] } }
*as_string = \&get;

1;

__END__

=head1 NAME

SVN::Dump::Text - A text block from a svn dump

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SEE ALSO

=head1 COPYRIGHT & LICENSE

Copyright 2006 Philippe 'BooK' Bruhat, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

