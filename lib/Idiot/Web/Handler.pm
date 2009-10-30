package Idiot::Web::Handler;
use Kamui::Web::Handler;

use_container 'Idiot::Container';
use_plugins [qw/Encode/];
use_view 'Kamui::View::TT';
use_dispatcher 'Idiot::Web::Dispatcher';
 
1;

