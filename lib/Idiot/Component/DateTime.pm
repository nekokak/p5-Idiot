package Idiot::Component::DateTime;
use Smoker;
use base 'Smoker::Component::Base';

sub install_to_component {
    my ($class, $component) = @_;

    $class->install_method($component, 'dt' => sub {
        my $c = shift;
        $c->{__dt} ||= Idiot::Component::__::DateTime->new($c);
    });
}

package Idiot::Component::__::DateTime;
use DateTime;
use DateTime::TimeZone;

sub new {
    my ($class, $c) = @_;
    bless { c => $c }, $class;
}

sub timezone {
    my $self = shift;
    $self->{_TIMEZONE} ||= DateTime::TimeZone->new(
        name => $self->{c}->config->get('app')->{timezone}
    );
}

sub now {
    my $self = shift;
    $self->{_NOW_DATETIME} ||= DateTime->now(time_zone => $self->timezone);
}

sub today {
    my $self = shift;
    $self->{_TODAY} ||= $self->now->clone->truncate( to => 'day' );
}

1;

