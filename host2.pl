#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket::INET;

my $socket;
my  $clientsocket;
my $serverdata;
my $clientdata;

$socket = new IO::Socket::INET (
    LocalHost => '127.0.0.1',
    LocalPort => '0155',
    Proto => 'tcp',
    Listen => 1,    
    Reuse => 1
) or die "Oops: $! \n";
print "Waiting for the Host 1.\n";


$clientsocket = $socket->accept();

print   "Connected from : ", $clientsocket->peerhost();     # Display messages
print   ", Port : ", $clientsocket->peerport(), "\n";

# Read from Input & Write some data to the client  
$serverdata = <STDIN>; 

print $clientsocket "$serverdata \n";

# read the data from the client
$clientdata = <$clientsocket>;
print "Host 1 : $clientdata\n";

$socket->close();  