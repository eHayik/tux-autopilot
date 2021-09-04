#!/bin/bash

if ! type "fish" > /dev/null; then

    sudo apt-add-repository ppa:fish-shell/release-3 -y
    sudo apt update
    sudo apt install fish -y

    # Set Fish as default shell for user
    echo /bin/fish | sudo tee -a /etc/shells

    # Change your default shell to fish
    chsh -s /bin/fish

    fish

    echo "Type 'exit' to logout"
    echo "Login back and confirm active shell with echo \$SHELL"

    #Install Fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher --version

    cp installers/fish/config.fish ~/.config/fish/
 
else
    fish 
fi   