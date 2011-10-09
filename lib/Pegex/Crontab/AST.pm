##
# name:      Pegex::Crontab::AST
# abstract:  Pegex Crontab Parser
# author:    Ingy döt Net <ingy@cpan.org>
# license:   perl
# copyright: 2011

package Pegex::Crontab::AST;
use Pegex::Mo;
extends 'Pegex::Receiver';

use lexicals;

sub cron_hash {
    my ($min, $hour, $dom, $mon, $dow, $cmd) = @{(shift)};
    lexicals;
}

sub env_hash {
    my ($var, $val) = @{(shift)};
    lexicals;
}

sub got_cron_line {
    my ($self, $node) = @_;
    cron_hash($node);
}

sub got_env_line {
    my ($self, $node) = @_;
    env_hash($node);
}
