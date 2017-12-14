package WHN::Web;

use strict;
use warnings;
use utf8;
use Kossy;
use Furl;
use JSON::MaybeXS qw/encode_json/;

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

post '/notify' => sub {
    my ( $self, $c )  = @_;

    my $payload = +{ text => sprintf('```%s```', $c->req->content) };
    my $furl = Furl->new;
    $furl->post($ENV{WEBHOOK_URL}, ['Content-Type', 'application/json'], encode_json($payload));

    $c->render_json($payload);
};

1;

