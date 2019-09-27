##
# Sometimes you may want to vagrant up your Homestead machine from anywhere on your filesystem.
# https://laravel.com/docs/5.6/homestead
function homestead() {
    ( cd ~/Documents/website && vagrant $* )
}

##
# Make and change to a directory
function mkcdir() {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

##
# Load RVM into a shell session *as a function*
# Automatically added by `rvm` installer
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

##
# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

##
# Get weather for CLI
# All this magic borrows from https://github.com/vybeauregard/promptworks
function w() {
    # Check if a local cached file exists and it was updated in the last hour
    if [ ! -f ~/.weather ] || [ `find ~/.weather -mmin +60` ]; then
	curl http://wttr.in/?format="%l:+%c++%t+%m" --output ~/.weather --silent
    fi

    # Print the local cache of weather data
    cat ~/.weather
}

##
# Show git branch and repo
function show_git_position() {
    local current_git_repo=$(git config --get remote.origin.url | sed 's/.git//g' | sed 's/.*\///')
    case ${current_git_repo} in
	"" )
	    return ;;
	* )
	    local current_git_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	    printf "${COLOR_ORANGE}${COLOR_BLACK_BG}${current_git_repo}${COLOR_GREEN}⎇ ${current_git_branch}${COLOR_DEFAULT}";;
    esac
}

##
# Show git status
function show_git_status() {
    local current_git_repo=$(git config --get remote.origin.url | sed 's/.git//g' | sed 's/.*\///')
    case ${current_git_repo} in
	"" )
	    printf "◉";;
	* )
	    git diff --no-ext-diff --quiet || w="◉"

	    printf " ";
	    if [ -z "$w" ]
	    then
		printf "◉";
	    else
		printf "${COLOR_GREEN}${w}${COLOR_DEFAULT}";
	    fi
    esac
}

##
# Colorify current working directory
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

##
# Show current directory
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

##
# Print cursor prompt
show_ps1 () {
    local host="\h"
    local dir="\$(current_dir)\$(show_git_position)\$(show_git_status)"
    printf "${host}:${dir} "
}
