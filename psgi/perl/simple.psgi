my $app = sub {
    my $env = shift;

    return [200, [ 'Content-type' => 'text/plain' ], ["Hello World!"]];
};

# vim: set ft=perl:
