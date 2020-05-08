#!/bin/bash

git clone https://github.com/jenv/jenv.git ~/.jenv

echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(jenv init -)"' >> ~/.bashrc
source ~/.bashrc

jenv enable-plugin "export"
jenv enable-plugin maven
exec $SHELL -l

jenv doctor
