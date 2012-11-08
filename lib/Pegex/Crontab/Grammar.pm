##
# name:      Pegex::Crontab::Grammar
# abstract:  Pegex Crontab Parser
# author:    Ingy döt Net <ingy@cpan.org>
# license:   perl
# copyright: 2011

package Pegex::Crontab::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => '../crontab-pgx/crontab.pgx';

sub make_tree {
  {
    '+toprule' => 'crontab',
    'EOL' => {
      '.rgx' => qr/\G\r?\n/
    },
    'blank_line' => {
      '.rgx' => qr/\G[\ \t]*\r?\n/
    },
    'command' => {
      '.rgx' => qr/\G(.*)/
    },
    'comment_line' => {
      '.rgx' => qr/\G[\ \t]*\#.*\r?\n/
    },
    'cron_line' => {
      '.all' => [
        {
          '.ref' => 'minute'
        },
        {
          '.rgx' => qr/\G\s+/
        },
        {
          '.ref' => 'hour'
        },
        {
          '.rgx' => qr/\G\s+/
        },
        {
          '.ref' => 'dom'
        },
        {
          '.rgx' => qr/\G\s+/
        },
        {
          '.ref' => 'month'
        },
        {
          '.rgx' => qr/\G\s+/
        },
        {
          '.ref' => 'dow'
        },
        {
          '.rgx' => qr/\G\s+/
        },
        {
          '.ref' => 'command'
        },
        {
          '.ref' => 'EOL'
        }
      ]
    },
    'crontab' => {
      '+min' => 0,
      '.any' => [
        {
          '.ref' => 'comment_line'
        },
        {
          '.ref' => 'blank_line'
        },
        {
          '.ref' => 'env_line'
        },
        {
          '.ref' => 'cron_line'
        }
      ]
    },
    'day' => {
      '.rgx' => qr/\G(mon|tue|wed|thu|fri|sat|sun)/
    },
    'dom' => {
      '.ref' => 'time'
    },
    'dow' => {
      '.ref' => 'time'
    },
    'env_line' => {
      '.all' => [
        {
          '.ref' => 'variable'
        },
        {
          '.rgx' => qr/\G=/
        },
        {
          '.ref' => 'value'
        },
        {
          '.ref' => 'EOL'
        }
      ]
    },
    'hour' => {
      '.ref' => 'time'
    },
    'minute' => {
      '.ref' => 'time'
    },
    'month' => {
      '.ref' => 'time'
    },
    'number' => {
      '.rgx' => qr/\G([0-9][0-9]?)/
    },
    'range' => {
      '.all' => [
        {
          '.ref' => 'number'
        },
        {
          '.rgx' => qr/\G\-/
        },
        {
          '.ref' => 'number'
        },
        {
          '+max' => 1,
          '.all' => [
            {
              '.rgx' => qr/\G\//
            },
            {
              '.ref' => 'number'
            }
          ]
        }
      ]
    },
    'star' => {
      '.rgx' => qr/\G(\*)/
    },
    'time' => {
      '.any' => [
        {
          '.ref' => 'star'
        },
        {
          '.ref' => 'number'
        },
        {
          '.ref' => 'range'
        },
        {
          '.ref' => 'day'
        }
      ]
    },
    'value' => {
      '.rgx' => qr/\G(.*)/
    },
    'variable' => {
      '.rgx' => qr/\G(\w+)/
    }
  }
}

1;
