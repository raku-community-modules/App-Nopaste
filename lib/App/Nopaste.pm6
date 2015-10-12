unit class App::Nopaste:version<1.001001>;

use Pastebin::Gist;
use Pastebin::Shadowcat;

method paste (
    $paste,
    Str  :$desc     = '',
    Str  :$filename = 'nopaste.txt',
    Bool :$public   = False,
) returns Str {

}

multi method fetch (Str $url where /gist/ ) returns Str {
    my ( $files, $desc ) = Pastebin::Gist.new.fetch($url);

    my Str $paste;
    $paste ~= "#### File: $_\n$files{$_}" for $files.keys;

    return ( $paste, $desc );
}
