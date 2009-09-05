package Idiot::Model::Skinny::Schema;
use DBIx::Skinny::Schema;
use DateTime;
use DateTime::Format::Strptime;
use DateTime::Format::MySQL;
use Data::GUID::URLSafe;
use Text::Hatena;
use Idiot::Component;

my $c = Idiot::Component->new;

sub pre_insert_hook {
    my ( $class, $args ) = @_;
    $args->{guid} = Data::GUID->new->as_base64_urlsafe;
    $args->{created_at} = $c->dt->now;
}

install_table page => schema {
    pk 'id';
    columns qw/id guid title body created_at updated_at/;
    trigger pre_insert => \&pre_insert_hook;
};

install_utf8_columns qw/title body/;

install_inflate_rule '^body$' => callback {
    inflate {
        Text::Hatena->parse(shift)
    };
};

install_inflate_rule '^.+_at$' => callback {
    inflate {
        my $value = shift;
        my $dt = DateTime::Format::Strptime->new(
            pattern   => '%Y-%m-%d %H:%M:%S',
            time_zone => $c->dt->timezone,
        )->parse_datetime($value);
        return DateTime->from_object( object => $dt );
    };
    deflate {
        my $value = shift;
        return DateTime::Format::MySQL->format_datetime($value);
    };
};

1;

