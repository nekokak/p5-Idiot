use Kamui;
use Idiot::Container;
use Path::Class;
use HTML::Entities;

my $home = container('home');

return +{
    view => {
        tt   => +{
            path    => $home->file('assets/tmpl')->stringify,
            options => '',
            filters => +{
                html_unescape => sub {
                    HTML::Entities::decode_entities(shift);
                },
            },
        },
    },
    connection_info => +{
        dsn      => 'dbi:mysql:idiot',
        username => 'user',
        password => 'pass',
    },
    validator_message => +{
        param => +{
            title => 'タイトル',
            body  => '本文'
        },
        function => +{
            not_null => '[_1]が空です',
        },
        message => +{
        },
    },
    timezone => 'Asia/Tokyo',
};

