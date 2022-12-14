[![Actions Status](https://github.com/Leont/sigpipe/workflows/test/badge.svg)](https://github.com/Leont/sigpipe/actions)

NAME
====

sigpipe - set up SIGPIPE correctly for CLI applications

SYNOPSIS
========

```raku
use sigpipe;
```

DESCRIPTION
===========

Raku's default sigpipe handling does the sensible things for networking applications, but entirely the wrong thing for CLI applications. For example a program like `raku -e 'loop { say "y" }' | head` will output a long error message that is entirely useless for the end-user. This module will instead use the unix default: end the program immediately without any ceremony.

AUTHOR
======

Leon Timmermans <fawaka@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Leon Timmermans

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

