##
# name:      Pegex::Crontab::Grammar
# abstract:  Pegex Crontab Parser
# author:    Ingy döt Net <ingy@cpan.org>
# license:   perl
# copyright: 2011

package Pegex::Crontab::Grammar;
use Mo;
extends 'Pegex::Grammar';

use constant text => '../crontab-pgx/crontab.pgx';

sub tree {
}

1;
