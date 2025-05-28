use strict;
use warnings;

my $target = "hello world";
my $index = 0;
my $pointer = 0;
my $ans = "";
my @chars = split('', "abcdefghijklmnopqrstuvwxyz");

sub main {
    my $cur = $chars[$index++];
    my $targetIndex = substr($target, $pointer, 1);

    if ($targetIndex eq ' ') {
        $pointer++;
        $ans .= " ";
    }

    if ($cur eq substr($target, $pointer, 1)) {
        $ans .= $cur;
        $pointer++;
    }

    my $toLog = $ans . $cur;
    if ($toLog =~ /dd$/) {
        chop $toLog;
    }

    print "$toLog\n";

    if ($ans eq $target) {
        print "Successfully logged Hello World!\n";
        exit;
    }

    $index = 0 if $index >= 26;
    main();
}

main();
