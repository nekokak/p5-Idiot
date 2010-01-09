package Idiot::Container;
use Kamui::Container -base;

register db => sub {
    my $self = shift;
    $self->load_class('Idiot::Model::DB');
    my $db = Idiot::Model::DB->new($self->get('conf')->{datasource});
    $db;
};

register timezone => sub {
    my $self = shift;
    $self->load_class('DateTime::TimeZone');
    DateTime::TimeZone->new(name => 'Asia/Tokyo');
};

1;

