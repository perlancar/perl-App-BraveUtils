package App::BraveUtils;

use 5.010001;
use strict 'subs', 'vars';
use warnings;
use Log::ger;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

use App::BrowserUtils ();

$SPEC{':package'} = {
    v => 1.1,
    summary => 'Utilities related to Brave browser',
};

$SPEC{ps_brave} = {
    v => 1.1,
    summary => "List Brave processes",
    args => {
        %App::BrowserUtils::args_common,
    },
};
sub ps_brave {
    App::BrowserUtils::_do_browser('ps', 'brave', @_);
}

$SPEC{pause_brave} = {
    v => 1.1,
    summary => "Pause (kill -STOP) Brave",
    description => $App::BrowserUtils::desc_pause,
    args => {
       %App::BrowserUtils::args_common,
    },
};
sub pause_brave {
    App::BrowserUtils::_do_browser('pause', 'brave', @_);
}

$SPEC{unpause_brave} = {
    v => 1.1,
    summary => "Unpause (resume, continue, kill -CONT) Brave",
    args => {
        %App::BrowserUtils::args_common,
    },
};
sub unpause_brave {
    App::BrowserUtils::_do_browser('unpause', 'brave', @_);
}

$SPEC{pause_and_unpause_brave} = {
    v => 1.1,
    summary => "Pause and unpause Brave alternately",
    description => $App::BrowserUtils::desc_pause_and_unpause,
    args => {
        %App::BrowserUtils::args_common,
        %App::BrowserUtils::argopt_periods,
    },
};
sub pause_and_unpause_brave {
    App::BrowserUtils::_do_browser('pause_and_unpause', 'brave', @_);
}

$SPEC{brave_has_processes} = {
    v => 1.1,
    summary => "Check whether Brave has processes",
    args => {
        %App::BrowserUtils::args_common,
        %App::BrowserUtils::argopt_quiet,
    },
};
sub brave_has_processes {
    App::BrowserUtils::_do_browser('has_processes', 'brave', @_);
}

$SPEC{brave_is_paused} = {
    v => 1.1,
    summary => "Check whether Brave is paused",
    description => <<'_',

Brave is defined as paused if *all* of its processes are in 'stop' state.

_
    args => {
        %App::BrowserUtils::args_common,
        %App::BrowserUtils::argopt_quiet,
    },
};
sub brave_is_paused {
    App::BrowserUtils::_do_browser('is_paused', 'brave', @_);
}

$SPEC{brave_is_running} = {
    v => 1.1,
    summary => "Check whether Brave is running",
    description => <<'_',

Brave is defined as running if there are some Brave processes that are *not*
in 'stop' state. In other words, if Brave has been started but is currently
paused, we do not say that it's running. If you want to check if Brave process
exists, you can use `ps_brave`.

_
    args => {
        %App::BrowserUtils::args_common,
        %App::BrowserUtils::argopt_quiet,
    },
};
sub brave_is_running {
    App::BrowserUtils::_do_browser('is_running', 'brave', @_);
}

$SPEC{terminate_brave} = {
    v => 1.1,
    summary => "Terminate Brave (by default with -KILL signal)",
    args => {
        %App::BrowserUtils::args_common,
        %App::BrowserUtils::argopt_signal,
    },
};
sub terminate_brave {
    App::BrowserUtils::_do_browser('terminate', 'brave', @_);
}

$SPEC{restart_brave} = {
    v => 1.1,
    summary => "Restart brave",
    args => {
        %App::BrowserUtils::argopt_brave_cmd,
        %App::BrowserUtils::argopt_quiet,
    },
    features => {
        dry_run => 1,
    },
};
sub restart_brave {
    App::BrowserUtils::restart_browsers(@_, restart_brave=>1);
}

$SPEC{start_brave} = {
    v => 1.1,
    summary => "Start brave if not already started",
    args => {
        %App::BrowserUtils::argopt_brave_cmd,
        %App::BrowserUtils::argopt_quiet,
    },
    features => {
        dry_run => 1,
    },
};
sub start_brave {
    App::BrowserUtils::start_browsers(@_, start_brave=>1);
}

1;
# ABSTRACT:

=head1 SYNOPSIS

=head1 DESCRIPTION

This distribution includes several utilities related to Brave browser:

#INSERT_EXECS_LIST


=head1 SEE ALSO

L<https://brave.com>

L<App::ChromeUtils>

L<App::FirefoxUtils>

L<App::OperaUtils>

L<App::VivaldiUtils>

L<App::BrowserUtils>
