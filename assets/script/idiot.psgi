use Plack::Builder;
use Idiot::Container;
use Idiot::Web::Handler;

my $app = Idiot::Web::Handler->new;
$app->setup;

my $home = container('home');

builder {
    enable "Plack::Middleware::Static",
           path => qr{^/(images|js|css)/},
           root => $home->file('assets/htdocs')->stringify;
    $app->handler;
};

