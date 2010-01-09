package Idiot::Api::Page;
use Kamui;
use Idiot::Container;

sub new { bless {}, __PACKAGE__ }

sub get {
    my ($self, $guid) = @_;
    return unless $guid;
    container('db')->single('page', {guid => $guid});
}

sub write {
    my ($self, $args) = @_;
    container('db')->create('page', $args);
}

1;

