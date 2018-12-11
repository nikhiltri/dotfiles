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
# Automatically added by `rvm` installer
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

## All this magic borrows from https://github.com/vybeauregard/promptworks
# Get weather for CLI
w() {
     local zip_code=60603;
     curl http://wttr.in/${zip_code}?0?Q
}

show_git_position() {
    local current_git_repo=$(git config --get remote.origin.url | sed 's/.git//g' | sed 's/.*\///')
    local current_git_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    case ${current_git_repo} in
        "" )
            return ;;
        * )
            printf "${COLOR_ORANGE}${COLOR_BLACK_BG}${current_git_repo}${COLOR_GREEN}.${current_git_branch}${COLOR_DEFAULT}";;
    esac
}
env_finder() {
    local path_color;
    local opposite_color;
    case $PWD in
        *beta* )
            path_color="COLOR_BLUE_BG"
            opposite_color="COLOR_BLUE";;
        *dev* )
            path_color="COLOR_GREEN_BG"
            opposite_color="COLOR_GREEN";;
        *test* )
            path_color="COLOR_ORANGE_BG"
            opposite_color="COLOR_ORANGE";;
        *prod* )
            path_color="COLOR_RED_BG"
            opposite_color="COLOR_RED";;
        * )
            return ;;
    esac
    printf "${!opposite_color}◄${COLOR_DEFAULT}${!path_color}${PWD##*/}${COLOR_DEFAULT}${!opposite_color}►${COLOR_DEFAULT}"
}
current_dir() {
    local color_change=$(env_finder)
    if [ $PWD == $HOME ]
    then
        printf '~'
    else
        if [ $color_change ]
        then
            printf "${color_change}"
        else
            printf "${PWD##*/} "
        fi
    fi
}
show_ps1 () {
    local host="\h"
    local dir="\$(current_dir)\$(show_git_position)"
    printf "${host}:${dir}\$ "
}
