#!/bin/bash

sudo apt-get install build-essential curl file git -y

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo eval" ($(brew --prefix)/bin/brew shellenv)" >> ~/.bash_profile
echo "eval $($(brew --prefix)/bin/brew shellenv)" >> ~/.profile
echo "eval $($(brew --prefix)/bin/brew shellenv)" >> ~/.bashrc

brew --version
brew install hello
hello
brew uninstall hello