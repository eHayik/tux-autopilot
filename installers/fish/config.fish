set -U fish_greeting '><(((">'

# Tools
abbr -a nf 'nano ~/.config/fish/config.fish'
abbr -a mf 'micro ~/.config/fish/config.fish'
abbr -a cf 'code ~/.config/fish/config.fish' 
abbr -a ll 'ls -laht'
alias nuke='sudo rm -rvf $argv'
alias gzd='gzip -dk $argv'
alias fkc='flatpak uninstall --unused'
alias please='sudo'
alias pl='sudo'
alias reload='source /home/ehayik/.config/fish/config.fish'
abbr -a  aptu 'sudo apt update'

function cl --wraps=clear --description 'alias cl clear'
  clear $argv;
end

function mkcd -d "Create a directory and set CWD"
    command mkdir -p $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
 end   

# Gradle
function guw -d "update gradle wrapper to the given version"
 ./gradlew wrapper --gradle-version $argv  --distribution-type bin
end
