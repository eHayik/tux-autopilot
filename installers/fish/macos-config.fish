if status is-interactive
    # Commands to run in interactive sessions can go here
end

### ADDING TO THE PATH
# First line removes the path; second line sets it. Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

### EXPORT ###

## Default Editor
set -x -g EDITOR "/opt/homebrew/bin/micro"

# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
## Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "/opt/homebrew/bin/"

## Add JetBrains shell scripts location 
fish_add_path "/Users/ehayik/Library/Application Support/JetBrains/Toolbox/scripts"

## Java Setup
set -x -g JAVA_17_HOME (/usr/libexec/java_home -v 17)
set -x -g JAVA_11_HOME (/usr/libexec/java_home -v 11)
set -x -g JAVA_8_HOME (/usr/libexec/java_home -v 1.8)

abbr -a java17 'set -x -g JAVA_HOME $JAVA_17_HOME'
abbr -a java11 'set -x -g JAVA_HOME $JAVA_11_HOME'
abbr -a java8 'set -x -g JAVA_HOME $JAVA_8_HOME'

## Maven
set -x MAVEN_OPTS "-Djava.net.preferIPv4Stack=true -XX:-TieredCompilation -XX:TieredStopAtLevel=1"

## Docker Remote Host
set -x -g DOCKER_HOST "ssh://Ehayik@192.168.100.78"

### END OF EXPORT ### 

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

# zsh config edtiors
abbr -a mz 'micro ~/.zshrc'
abbr -a cz 'code ~/.zshrc'

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
alias gclean='git clean -xdf'

## files
abbr -a ll 'ls -laht'
alias nuke='sudo rm -rvf $argv'

## brew
abbr -a install 'brew install'
abbr -a update 'brew update'
abbr -a upgrade 'brew upgrade'
abbr -a tap 'brew tap'
abbr -a untap 'brew untap'
abbr -a cask-install 'brew install --cask'
abbr -a cask-uninstall 'brew uninstall --cask'
abbr -a cask-upgrade 'brew cask upgrade'

## Espanso
abbr -a ce 'code ~/Library/Application\ Support/espanso/match/base.yml'

## Docker
abbr -a  docker-start 'colima start'
abbr -a  docker-stop 'colima stop'

## Enable Startship prompt
starship init fish | source

## Enable Jenv
status --is-interactive; and source (jenv init --no-rehash -|psub)

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/ehayik/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)