[![Actions Status](https://github.com/raku-community-modules/App-Nopaste/workflows/test/badge.svg)](https://github.com/raku-community-modules/App-Nopaste/actions)

NAME
====

App::Nopaste - command line interface to pastebins

SYNOPSIS
========

    nopaste http://fpaste.scsys.co.uk/500226

    nopaste https://gist.github.com/zoffixznet/83adc0789cdb0cf57d43

    nopaste file1 dir/foo/file2 file3

DESCRIPTION
===========

This module allows to paste to create GitHub Gists as retrieve them.

PASTEBINS
=========

Currently, the module supports fetching/pasting from [https://gist.github.com/](https://gist.github.com/) and [http://fpaste.scsys.co.uk/](http://fpaste.scsys.co.uk/). To use [https://gist.github.com/](https://gist.github.com/) you need to [create a GitHub token](https://github.com/settings/tokens). Only the `gist` permission is needed. Set `PASTEBIN_GIST_TOKEN` environmental variable to the value of that token.

If `PASTEBIN_GIST_TOKEN` is set, pastes will be created on [https://gist.github.com/](https://gist.github.com/); otherwise on [http://fpaste.scsys.co.uk/](http://fpaste.scsys.co.uk/).

AUTHOR
======

Zoffix Znet

COPYRIGHT AND LICENSE
=====================

Copyright 2015 - 2016 Zoffix Znet

Copyright 2017 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

