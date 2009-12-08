package Idiot::Web::Handler;
use Kamui::Web::Handler;

use_container 'Idiot::Container';
use_plugins [qw/Encode FormValidatorLite/];
use_view 'Kamui::View::MT';
use_dispatcher 'Idiot::Web::Dispatcher';
 
1;

