set -U fish_greeting '><(((">'

if ! type "code" > /dev/null;
    abbr -a cf 'code ~/.config/fish/config.fish'
end

if ! type "nano" > /dev/null;
    abbr -a nf 'nano ~/.config/fish/config.fish'
end