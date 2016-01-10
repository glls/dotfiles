#!/bin/sh

# update
sudo apt-get update
sudo apt-get dist-upgrade

# cleanup
sudo apt-get autoremove
sudo apt-get clean