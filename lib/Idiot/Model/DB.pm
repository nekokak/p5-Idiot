package Idiot::Model::DB;
use base 'Smoker::Model';
use Idiot::Config;
use Idiot::Model::Skinny;

sub model_init {
    Idiot::Model::Skinny->new(
        Idiot::Config->get('model')->{connect_info}
    );
}

1;

