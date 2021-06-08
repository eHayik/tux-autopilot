#!/bin/bash

: '
If add-apt-repository command is not found, install it first with:

sudo apt-get install software-properties-common python-software-properties
'

if ! type "git" > /dev/null; then
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git -y

    git config --global user.name $USER_NAME
    git config --global user.email $USER_MAIL

else
    git --version
fi   