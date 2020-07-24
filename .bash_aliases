alias ls='ls -Gla '
alias emacs='emacs -nw'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy; echo '¯\_(ツ)_/¯'";
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias finder="open -a 'Finder' ."
alias agmore="ag --pager 'more -R'"
alias lint="php-cs-fixer fix --allow-risky=yes --diff --diff-format udiff"

# Older versions of PHP, when needed
alias php56='/usr/local/Cellar/php56/5.6.30_6/bin/php'
alias php54='/usr/local/Cellar/php54/5.4.45_6/bin/php'

# Use Lastpass for SSHing into boxes
alias lpshow='lpass show --password -c'
alias sshlp='function _blah(){ lpass show --password -c $1; ssh $1; };_blah'

# Git shortcuts
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gd='git diff'
alias gf='git fetch'
alias gs='git status'
alias gl="git log --pretty=oneline --abbrev-commit --decorate"
alias wip="git add . && git commit -m 'wip'"
alias nope='git reset --hard; git clean -df;'

# Laravel shortcuts
alias artisan='php artisan'
alias migrate='php artisan migrate --step'
alias tinker='php artisan tinker'
alias p='phpunit'
alias pf='phpunit --filter'
alias ccclear='php artisan cache:clear; php artisan config:clear; php artisan view:clear; php artisan route:clear;'
alias cdo='composer dump-autoload -o'
alias tl='tail -f -n 450 storage/logs/laravel*.log | grep -i -E "^\[\d{4}\-\d{2}\-\d{2} \d{2}:\d{2}:\d{2}\]|Next [\w\W]+?\:" --color'

alias aicbash='./aic.sh --ratio 150'
