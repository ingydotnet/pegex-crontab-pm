package Pegex::Crontab;
our $VERSION = '0.13';

use Pegex::Base;
extends 'Pegex::Module';

use Pegex::Crontab::Grammar;
use Pegex::Crontab::AST;

has grammar_class => 'Pegex::Crontab::Grammar';
has receiver_class => 'Pegex::Crontab::AST';

1;
