# Sometimes you may want to vagrant up your Homestead machine from anywhere on your filesystem.
# https://laravel.com/docs/5.6/homestead
function homestead() {
    ( cd ~/Documents/website && vagrant $* )
}

# Make and change to a directory
function mkcdir ()
{
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# Load RVM into a shell session *as a function*
# Not sure what this does, but it solved some issues with running rvm and rackup
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion



