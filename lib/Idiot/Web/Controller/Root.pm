package Idiot::Web::Controller::Root;
use Kamui::Web::Controller -base;
use Idiot::Container qw/api/;

sub do_index { }

sub do_show {
    my ($class, $c, ) = @_;

    $c->stash->{page} = api('Page')->get($c->req->param('page_guid'))
      or $c->redirect('/');
}

sub do_add {
    my ($class, $c, ) = @_;

    if ($c->req->is_post_request) {
        my $page = api('Page')->write(
            {
                title => $c->req->param('title'),
                body  => $c->req->param('body'),
            }
        );
        
        return $c->redirect('/show',{page_guid => $page->guid});
    }
}

1;

