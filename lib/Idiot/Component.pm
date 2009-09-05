package Idiot::Component;
use Smoker;
use base 'Smoker::Component';

__PACKAGE__->install_components(qw/Config Model Stash +Idiot::Component::DateTime/);

1;

