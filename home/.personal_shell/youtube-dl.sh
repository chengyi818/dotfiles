#!/bin/bash

for i in `cat url`
do
    echo "downloading : $i"
    proxychains youtube-dl -f 22 $i
done
