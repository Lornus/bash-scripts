#! /bin/bash


dumping(){

echo "~~~~~~~~~~~~~~~~~~~~~~ IP A ~~~~~~~~~~~~~~~~~~~~~~ "

ip a

echo "~~~~~~~~~~~~~~~~~~~~~~ tcpdump ~~~~~~~~~~~~~~~~~~~~~~ "

sudo tcpdump -i eth0 -c 10

echo "~~~~~~~~~~~~~~~~~~~~~~ tshark ~~~~~~~~~~~~~~~~~~~~~~ "

sudo tshark -i eth0 -c 10

}


dumping 
