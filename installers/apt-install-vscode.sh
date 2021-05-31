#!/bin/bash

: '
If add-apt-repository command is not found, install it first with:

sudo apt-get install software-properties-common python-software-properties
'

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code -y

# Port of IntelliJ IDEA key bindings for VS Code. Includes keymaps for popular JetBrains products 
#such as IntelliJ Ultimate, WebStorm, PyCharm, PHP Storm
code --install-extension k--kato.intellij-idea-keybindings