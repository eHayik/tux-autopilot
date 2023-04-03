#!/bin/bash

if ! type "fish" > /dev/null; then

    sudo apt-add-repository ppa:fish-shell/release-3 -y
    sudo apt update
    sudo apt install fish -y

    fish

    # Add Fish to the List of Shells
    echo /bin/fish | sudo tee -a /etc/shells

    # Set Fish as Your Default Shell
    chsh -s /bin/fish

    # Configuring fish
    cat linux-config.fish >> ~/.config/fish/config.fish
    source ~/.config/fish/config.fish

    #Install Fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher --version

    echo "Type 'exit' to logout"
    echo "Login back and confirm active shell with echo \$SHELL"
    echo "Run 'fish_config'" to open a web-based GUI where you can select a color theme and configure the look of the shell"

else
    fish 
fi   