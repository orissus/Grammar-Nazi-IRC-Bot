#!/usr/bin/perl
use strict;
use warnings;
use GrammarBot;

my $bot = GrammarBot->new(
    server => "irc.freenode.net",
    port   => "6667",
    channels => ["#grammarbot"],

    nick      => "Grammy",
    alt_nicks => ["Grammargh"],
    username  => "gram",
    name      => "Gram",
  );

$bot->run();
