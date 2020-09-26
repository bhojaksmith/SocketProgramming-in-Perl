#!/usr/bin/perl -w
 
use strict;
use IO::Socket::INET;
 
my $server = shift;  ##  If this were remote it would be an IP, but localhost for now
my $port = shift;  ##  Same as before
 
my $socket = IO::Socket::INET->new(
        PeerAddr        => $server,
        PeerPort        => $port,
        Proto           => 'tcp' ) || die "[!] Can not connect to $server:$port\n";
 
print "Establishing connection to $server:$port\n";
 
##  Our interactive loop
while (<STDIN>) {
        print $socket $_;
        print scalar <$socket>;
}
close $socket || die "[!] Can not close connection...\n";  ##  Always gotta close