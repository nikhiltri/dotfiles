# Import colors
if [ -f ~/.bash_colors ]; then
    source ~/.bash_colors
fi

# Import aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Import functions
if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

# Import exports, including modifications to PATH
if [ -f ~/.bash_exports ]; then
    source ~/.bash_exports
fi
