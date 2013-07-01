= tpb.rb
Simple Ruby script to search thepiratebay ordered by seeds decreasing and print
the first magnet link and how many seeds there are. The goal is to be able to
use this from a remote rtorrent machine. Also, to satisfy a personal itch to
benchmark `nokigiri` vs a regex strategy.

```bash
$ ruby tpb.rb ubuntu
Regex
magnet:?xt=urn:btih:daac7008e2e3a6e4321950c131690aca20c5a08a&dn=ubuntu-13.04-desktop-i386.iso&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Ftracker.publicbt.com%3A80&tr=udp%3A%2F%2Ftracker.istole.it%3A6969&tr=udp%3A%2F%2Ftracker.ccc.de%3A80&tr=udp%3A%2F%2Fopen.demonii.com%3A1337
82
Elapsed: 0.00047
```

```bash
$ ruby tpb.rb ubuntu
XML
82 seeds
magnet:?xt=urn:btih:daac7008e2e3a6e4321950c131690aca20c5a08a&dn=ubuntu-13.04-desktop-i386.iso&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Ftracker.publicbt.com%3A80&tr=udp%3A%2F%2Ftracker.istole.it%3A6969&tr=udp%3A%2F%2Ftracker.ccc.de%3A80&tr=udp%3A%2F%2Fopen.demonii.com%3A1337
Elapsed: 0.008674
```
