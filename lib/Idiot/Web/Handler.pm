package Idiot::Web::Handler;
use Smoker;
use base 'Smoker::Web::Handler';
use Idiot::Web::Component;

sub web_component { 'Idiot::Web::Component' }
sub base_name { 'Idiot' }

1;

