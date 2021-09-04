
#!/bin/bash
# source https://velog.io/@spearkkk/Usage-jEnv-in-Fish

git clone https://github.com/jenv/jenv.git ~/.jenv

echo 'set PATH $HOME/.jenv/bin $PATH' >> ~/.config/fish/config.fish
echo 'status --is-interactive; and source (jenv init -|psub)' >> ~/.config/fish/config.fish
mkdir ~/.config/fish/function
cp ~/.jenv/fish/jenv.fish ~/.config/fish/function/jenv.fish
cp ~/.jenv/fish/export.fish ~/.config/fish/function/export.fish

jenv enable-plugin "export"
jenv enable-plugin maven
jenv enable-plugin gradle
exec $SHELL -l

jenv doctor
