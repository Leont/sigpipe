unit package sigpipe;

use NativeCall;
my sub signal(int32 $signal, long $func) is native { * }

INIT {
	# if signal or SIGPIPE doesn't exist this is a noop.
	try signal(Signal.WHO<SIGPIPE>, 0);
}

=begin pod

=head1 NAME

sigpipe - set up SIGPIPE correctly for CLI applications

=head1 SYNOPSIS

=begin code :lang<raku>

use sigpipe;
=end code

=head1 DESCRIPTION

Raku's default sigpipe handling does the sensible things for networking applications, but entirely the wrong thing for CLI applications. For example a program like C<raku -e 'loop { say "y" }' | head> will output a long error message that is entirely useless for the end-user. This module will instead use the unix default: end the program immediately without any ceremony.

=head1 AUTHOR

Leon Timmermans <fawaka@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2022 Leon Timmermans

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
