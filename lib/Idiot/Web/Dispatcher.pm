package Idiot::Web::Dispatcher;
use Kamui::Web::Dispatcher;

on '/' => run {
    return 'Root', 'index', FALSE, +{};
};

on '/show' => run {
    return 'Root', 'show', FALSE, +{ };
};

on '/add' => run {
    return 'Root', 'add', FALSE, +{ };
};

1;

