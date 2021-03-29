#!/usr/bin/perl

while (<>) {
    @F = split /\e\[m/;
    print "<div class=\"line\">" . join("</span>",
        # replace ANSI color codes with a span
        map {s/ ?\e\[([0-9;]+m)/<span class="$1">/r}
        # add missing opening tags when there's no color code
        map {$_ =~ m/(\e\[([0-9;]+m)|^\n?$)/ ? $_ : s/^ ?(.*)$/<span class="">$1/r}
        # remove trailing whitespace
        map {s/\s+$//r} @F) . "</div>\n";
}