package SayTwiML::Web;

use strict;
use warnings;
use utf8;
use Kossy;

filter 'set_title' => sub {
    my $app = shift;
    sub {
        my ( $self, $c )  = @_;
        $c->stash->{site_name} = __PACKAGE__;
        $app->($self,$c);
    }
};

get '/' => [qw/set_title/] => sub {
    my ( $self, $c )  = @_;
    $c->render('index.tx', { greeting => "Hello" });
};

get '/twiml' => sub {
    my ( $self, $c )  = @_;
    my $result = $c->req->validator([
        'alertId' => {
            default => 'not defined',
        }
    ]);
    my $res = $c->render('twiml.tx', { alertId => $result->valid->get('alertId') });
    $res->content_type('text/xml; charset=UTF-8');
    $res;
};

get '/json' => sub {
    my ( $self, $c )  = @_;
    my $result = $c->req->validator([
        'q' => {
            default => 'Hello',
            rule => [
                [['CHOICE',qw/Hello Bye/],'Hello or Bye']
            ],
        }
    ]);
    $c->render_json({ greeting => $result->valid->get('q') });
};

1;

