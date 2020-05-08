#!/bin/bash

:'
If add-apt-repository command is not found, install it first with: 

sudo apt-get install software-properties-common python-software-properties 
'

sudo add-apt-repository ppa:linuxuprising/guake
sudo apt update
sudo apt install guake -y
