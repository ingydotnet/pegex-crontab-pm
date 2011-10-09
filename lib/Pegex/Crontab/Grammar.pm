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
  {
    '+top' => 'crontab',
    'EOL' => {
      '.rgx' => qr/(?-xism:\G\r?\n)/
    },
    'blank_line' => {
      '.rgx' => qr/(?-xism:\G[\ \t]*\r?\n)/
    },
    'command' => {
      '.rgx' => qr/(?-xism:\G(.*))/
    },
    'comment_line' => {
      '.rgx' => qr/(?-xism:\G[\ \t]*\#.*\r?\n)/
    },
    'cron_line' => {
      '.all' => [
        {
          '.ref' => 'minute'
        },
        {
          '.rgx' => qr/(?-xism:\G\s+)/
        },
        {
          '.ref' => 'hour'
        },
        {
          '.rgx' => qr/(?-xism:\G\s+)/
        },
        {
          '.ref' => 'dom'
        },
        {
          '.rgx' => qr/(?-xism:\G\s+)/
        },
        {
          '.ref' => 'month'
        },
        {
          '.rgx' => qr/(?-xism:\G\s+)/
        },
        {
          '.ref' => 'dow'
        },
        {
          '.rgx' => qr/(?-xism:\G\s+)/
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
      '.rgx' => qr/(?-xism:\G(mon|tue|wed|thu|fri|sat|sun))/
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
          '.rgx' => qr/(?-xism:\G=)/
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
      '.rgx' => qr/(?-xism:\G([0-9][0-9]?))/
    },
    'range' => {
      '.all' => [
        {
          '.ref' => 'number'
        },
        {
          '.rgx' => qr/(?-xism:\G\-)/
        },
        {
          '.ref' => 'number'
        },
        {
          '+max' => 1,
          '.all' => [
            {
              '.rgx' => qr/(?-xism:\G\/)/
            },
            {
              '.ref' => 'number'
            }
          ]
        }
      ]
    },
    'star' => {
      '.rgx' => qr/(?-xism:\G(\*))/
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
      '.rgx' => qr/(?-xism:\G(.*))/
    },
    'variable' => {
      '.rgx' => qr/(?-xism:\G(\w+))/
    }
  }
}

1;
