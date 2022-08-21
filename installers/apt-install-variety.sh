#!/bin/bash

# https://github.com/varietywalls/variety

: '
If add-apt-repository command is not found, install it first with:

sudo apt-get install software-properties-common python-software-properties
'

sudo add-apt-repository ppa:variety/stable
sudo apt update
sudo apt install variety
