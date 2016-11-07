#!/usr/bin/env perl 

use strict;
use warnings;

use FCGI;
use Socket;

my $sock = FCGI::OpenSocket('127.0.0.1:11111', SOMAXCONN);
my $request = FCGI::Request(\*STDIN, \*STDOUT, \*STDERR, \%ENV, $sock, FCGI::FAIL_ACCEPT_ON_INTR);

while ($request->Accept >= 0) {
    print "Content-type: text/html\r\n\r\n";

    print<<"    EOT";
    <html>
    <head><title>Perl FCGI</title></head>
    <body bgcolor="#fff">
    <p>Environment variables:</p>
    <table border="1">
    EOT
    for my $key (sort keys %ENV) {
    	print "<tr><td>$key</td><td>$ENV{$key}</td></tr>\n";
    }
    print<<"    EOT";
    </table>
    </body>
    </html>
    EOT
}

FCGI::CloseSocket($sock);
