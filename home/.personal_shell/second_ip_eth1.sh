#!/bin/sh
sudo ip addr add 192.168.200.10/24 dev eth1
echo $(sudo ip address show eth1)
