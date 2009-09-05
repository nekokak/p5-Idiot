package Idiot::Web::C::Root;
use Smoker;

sub dispatch_index { }

sub dispatch_show {
    my ($class, $context) = @_;

    if (my $page_guid = $context->req->param('page_guid')) {
        $context->stash->{page} = $context->model('DB')->single('page',{guid => $page_guid});
    }

    unless ($context->stash->{page}) {
        return $context->redirect('/');
    }
}

sub dispatch_add {
    my ($class, $context) = @_;

    if ($context->is_post_request) {
        my $page = $context->model('DB')->create('page',
            {
                title => $context->req->param('title'),
                body  => $context->req->param('body'),
            }
        );
        
        return $context->redirect('/show',{page_guid => $page->guid});
    }
}

1;

