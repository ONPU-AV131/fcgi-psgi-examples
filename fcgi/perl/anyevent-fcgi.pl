#!/usr/bin/env perl 

use strict;
use warnings;

use AnyEvent; use EV;
use AnyEvent::FCGI;

my $fcgi = AnyEvent::FCGI->new(
    port => 11111,
    on_request => sub {
        my $request = shift;

        $request->respond(
            "Hello World from AnyEvent::FCGI!",
            'Content-type' => 'text/plain'
        );
    }
);

my $cv = AnyEvent->condvar;
my $w = AnyEvent->signal(
    signal => 'INT',
    cb => sub {
        $cv->send;
    }
);

$cv->recv;
