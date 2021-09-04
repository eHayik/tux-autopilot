#!/bin/bash

if ! type "brew" > /dev/null; then
    sudo apt-get install build-essential curl file -y
    
    ./apt-install-git.sh

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    test -r ~/.bash_profile && echo eval" ($(brew --prefix)/bin/brew shellenv)" >> ~/.bash_profile
    echo "eval $($(brew --prefix)/bin/brew shellenv)" >> ~/.profile
    echo "eval $($(brew --prefix)/bin/brew shellenv)" >> ~/.bashrc
    source ~/.profile
    source ~/.bashrc

    brew --version
    brew install hello
    hello
    brew uninstall hello
else 
    brew --version
fi