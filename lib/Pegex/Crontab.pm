##
# name:      Pegex::Crontab
# abstract:  Pegex Crontab Parser
# author:    Ingy döt Net <ingy@cpan.org>
# license:   perl
# copyright: 2011
# see:
# - Pegex

use 5.010;

use Pegex 0.21 ();
use lexicals 0.21 ();

package Pegex::Crontab;
use Pegex::Base;
extends 'Pegex::Module';

our $VERSION = '0.12';

use Pegex::Crontab::Grammar;
use Pegex::Crontab::AST;

has grammar_class => 'Pegex::Crontab::Grammar';
has receiver_class => 'Pegex::Crontab::AST';

1;

=head1 SYNOPSIS

    use Pegex::Crontab;

    $crontabs = Pegex::Crontab->new->parse(
        "0 5 * * 1 tar -zcf /var/backups/home.tgz /home/" . "\n"
    );

    use feature qw( say );
    say $crontabs->[0]->{cmd};  # "tar -zcf /var/backups/home.tgz /home/"
    say $crontabs->[0]->{min};  # "0"
    say $crontabs->[0]->{hour}; # "5"
    say $crontabs->[0]->{dom};  # "*"
    say $crontabs->[0]->{mon};  # "*"
    say $crontabs->[0]->{dow};  # "1"

=head1 DESCRIPTION

Pegex::Crontab is a crontab parser written in Pegex.
