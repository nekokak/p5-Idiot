package Idiot::Api::Page;
use Kamui;
use Idiot::Model::DB;
use Idiot::Container;

sub new {
    my $class = shift;
    bless {
        db => Idiot::Model::DB->new(container('conf')->{connection_info}),
    }, $class;
}

sub db { $_[0]->{db} }

sub get {
    my ($self, $guid) = @_;
    return unless $guid;
    $self->db->single('page',{guid => $guid});
}

sub write {
    my ($self, $args) = @_;
    $self->db->create('page', $args);
}

1;

