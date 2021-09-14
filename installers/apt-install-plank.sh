#!/bin/bash

# Plank is a Linux dock that allows starting pinned applications and manage open windows

: '
If add-apt-repository command is not found, install it first with:
sudo apt-get install software-properties-common python-software-properties
'

sudo add-apt-repository ppa:ricotz/docky -y
sudo apt update
sudo apt install plank 
