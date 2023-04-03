#!/bin/bash

brew install fish

fish

# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "/opt/homebrew/bin/"

# Add Fish to the List of Shells
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells

# Set Fish as Your Default Shell
chsh -s /opt/homebrew/bin/fish

# Configuring fish
cat macos-config.fish >> ~/.config/fish/config.fish
source ~/.config/fish/config.fish

#Install Fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher --version

echo "Type 'exit' to logout"
echo "Login back and confirm active shell with echo \$SHELL"
echo "Run 'fish_config'" to open a web-based GUI where you can select a color theme and configure the look of the shell"