### ADDING TO THE PATH
# First line removes the path; second line sets it. Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

### EXPORT ###

fish_add_path "/opt/homebrew/bin/"

#### FUNCTIONS ####
function fish_greeting
    echo '\__O<'
    echo ' \/   X ><(((">'
    echo ' ""'
end

function cl --wraps=clear --description 'Alias for clear command'
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

function brainsync -d "Syncronize my second brain, pulling from GitHub"
    z second-brain-vault
    git stash
    git pull --rebase origin main
end

 ## Gradle
function guw -d "Update gradle wrapper to the given version"
    ./gradlew wrapper --gradle-version $argv  --distribution-type bin
end

### END OF FUNCTIONS ###

### ALIASES ###

alias please='sudo'
alias pl='sudo'

# navigation
alias ..='cd ..'
alias ...='cd ../..'

# fish config editors
abbr -a mf 'micro ~/.config/fish/config.fish'
abbr -a cf 'code ~/.config/fish/config.fish' 
alias reload='source ~/.config/fish/config.fish'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

## files
abbr -a ll 'ls -laht'
alias nuke='sudo rm -rvfi $argv'

## packages

abbr -a install 'brew install'
abbr -a  update 'brew update'
abbr -a  upgrade 'brew upgrade'
abbr -a tap 'brew tap'
abbr -a untap 'brew untap'
abbr -a cask-install 'brew install --cask'
abbr -a cask-upgrade 'brew cask upgrade'

## Enable Startship prompt
# starship init fish | source

## Enable Jenv
#set PATH $HOME/.jenv/bin $PATH
#status --is-interactive; and source (jenv init --no-rehash -|psub)