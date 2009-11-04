package Idiot::Api::Form;
use Kamui;
use HTML::Shakan;

sub new {
    my $class = shift;
    bless {}, $class;
}

sub form {
    my ($self, $req, @args) = @_;
    HTML::Shakan->new(
        fields => [ @args ],
        request => $req,
    );
}

sub add {
    my ($self, $req) = @_;

    $self->form(
        $req => (
            TextField(name => 'title', label => 'title'
                ,
constraints => [
                    'NOT_NULL',
                ],
            ),
            TextField(name => 'body' , label => 'body', widget => 'textarea', attr => {rows => '25', cols => '90'}  ),
        )
    );
}

1;

