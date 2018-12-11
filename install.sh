#!/bin/bash

# Create symlinks to these files in the home directory.
# On a new system, some of these files may already be there. So take a look
# to make sure there not anything you might want to keep before you wipe
# them away.
ln -s ~/.dotfiles/.bash_aliases ~
ln -s ~/.dotfiles/.bash_exports ~
ln -s ~/.dotfiles/.bash_functions ~
ln -s ~/.dotfiles/.bash_profile ~
ln -s ~/.dotfiles/.bash_colors ~
ln -s ~/.dotfiles/.bashrc ~
ln -s ~/.dotfiles/.emacs ~
ln -s ~/.dotfiles/.ignore ~
