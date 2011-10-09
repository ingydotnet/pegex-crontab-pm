##
# name:      Pegex::Crontab
# abstract:  Pegex Crontab Parser
# author:    Ingy döt Net <ingy@cpan.org>
# license:   perl
# copyright: 2011
# see:
# - Pegex

use 5.010;

use Pegex 0.18 ();

package Pegex::Crontab;
use Pegex::Mo;
extends 'Pegex::Module';

our $VERSION = '0.10';

use constant receiver => 'Pegex::Crontab::AST';

1;

=head1 SYNOPSIS

    my $data = Pegex::Crontab->parse($json);

=head1 DESCRIPTION

Pegex::Crontab is a crontab parser written in Pegex.
