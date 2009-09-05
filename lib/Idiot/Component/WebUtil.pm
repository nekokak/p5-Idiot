package Idiot::Component::WebUtil;
use Smoker;
use base 'Smoker::Component::Base';
use URI;

# とりあえず適当につっこんでる
sub install_to_component {
    my ($class, $component) = @_;

    $class->install_method($component, 'redirect' => sub {
        my ($c, $path, $params) = @_;
        my $res = $c->res;

        my $uri = URI->new($path);
        $params ||= {};
        $uri->query_form( %{ $params } );
        $path = $uri->as_string;

        $res->header(location => $path);
        $res->status(302);

        $res;
    });

    $class->install_method($component, 'is_post_request' => sub {
        my $c = shift;
        $c->req->method eq 'POST'
    });

    $class->install_method($component, 'not_found' => sub {
        my $c = shift;
        my $res = $c->res;

        $res->status(404);
        $res->body("NOT FOUND");

        $res;
    });
}
1;

