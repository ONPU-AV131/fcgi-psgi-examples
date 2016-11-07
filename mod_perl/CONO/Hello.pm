package CONO::Hello;

use Apache2::Request;
use Apache2::RequestRec ();
use Apache2::RequestIO ();
use Apache2::Const -compile => qw(OK);

sub handler {
    my $r = Apache2::Request->new(shift);

    $r->content_type('text/plain');

    my $name = $r->param("name") || 'unknown';
    $r->print("Hello $name!");

    return Apache2::Const::OK;
}

42;
