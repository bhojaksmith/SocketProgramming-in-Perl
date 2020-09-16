#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket::INET;

my $socket;
my $serverdata;
my $clientdata;

$socket = new IO::Socket::INET (
  PeerHost => '127.0.0.1',
  PeerPort => '0155',
  Proto => 'tcp',
) or die "$!\n";

print "Connected to the Host 2.\n";

# read the message sent by server.
$serverdata = <$socket>;
print "Host 2 : $serverdata \n";

# Read from Input & Write some data to the client  
$clientdata = <STDIN>; 

print $socket "$clientdata \n";

$socket->close();