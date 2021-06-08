#!/bin/bash

: '
If add-apt-repository command is not found, install it first with: 

sudo apt-get install software-properties-common python-software-properties 
'

if ! type "guake" > /dev/null; then
    sudo add-apt-repository ppa:linuxuprising/guake -y
    sudo apt update
    sudo apt install guake -y
else
    guake --version
fi   
