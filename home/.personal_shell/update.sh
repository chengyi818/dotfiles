#!/bin/bash
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo apt-get clean
sudo apt-get update
sudo apt-get -y upgrade
