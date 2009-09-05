package Idiot::Config;
use base 'Smoker::Config';

__PACKAGE__->config_dir_map(
    +{
        testing => './assets/config/',
    }
);

__PACKAGE__->env('testing');

1;

