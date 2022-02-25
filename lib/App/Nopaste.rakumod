use Pastebin::Gist;
use Pastebin::Shadowcat;

unit class App::Nopaste:ver<1.002>:auth<zef:raku-community-modules>;

subset ValidPastebins of Str where any <gist shadow>;
method paste(@files --> Str:D) {
    if %*ENV<PASTEBIN_GIST_TOKEN> {
        my %paste;
        %paste{$_.IO.basename}<content> = $_.IO.slurp for @files;
        Pastebin::Gist.new.paste(%paste)
    }
    else {
        my $content := @files == 1
          ?? @files[0].IO.slurp
          !! @files.map({ "#### File: $_\n" ~ .IO.slurp }).join("\n\n\n");
        Pastebin::Shadowcat.new.paste($content)
    }
}

multi method fetch(Str:D $url where .contains('gist') --> List:D) {
    my ($files, $desc) = Pastebin::Gist.new.fetch($url);
    $files.keys.map({"#### File: $_\n$files{$_}"}).join, $desc || 'N/A'
}

multi method fetch(Str:D $url where .contains('fpaste') --> List:D) {
    my ($paste, $desc) = Pastebin::Shadowcat.new.fetch($url);
    $paste, $desc || 'N/A'
}

=begin pod

=head1 NAME

App::Nopaste - command line interface to pastebins

=head1 SYNOPSIS

    nopaste http://fpaste.scsys.co.uk/500226

    nopaste https://gist.github.com/zoffixznet/83adc0789cdb0cf57d43

    nopaste file1 dir/foo/file2 file3

=head1 DESCRIPTION

This module allows to paste to create GitHub Gists as retrieve them.

=head1 PASTEBINS

Currently, the module supports fetching/pasting from
L<https://gist.github.com/> and L<http://fpaste.scsys.co.uk/>. To
use L<https://gist.github.com/> you need to
L<create a GitHub token|https://github.com/settings/tokens>. Only the C<gist>
permission is needed. Set C<PASTEBIN_GIST_TOKEN> environmental variable
to the value of that token.

If C<PASTEBIN_GIST_TOKEN> is set, pastes will be created on
L<https://gist.github.com/>; otherwise on L<http://fpaste.scsys.co.uk/>.

=head1 AUTHOR

Zoffix Znet

=head1 COPYRIGHT AND LICENSE

Copyright 2015 - 2016 Zoffix Znet

Copyright 2017 - 2022 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
