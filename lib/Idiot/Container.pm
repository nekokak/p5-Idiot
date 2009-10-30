package Idiot::Container;
use Kamui::Container -base;

register now => sub {
    my $self = shift;
    $self->load_class('DateTime');
    DateTime->now(time_zone => $self->get('conf')->{timezone});
};

1;

