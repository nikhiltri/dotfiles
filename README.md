# .dotfiles

At long last, a consolidated place where I can keep the custom configurations
I make on my development machines. I use repo this to keep track of changes I make
over time, and to make working on a new system easier.

## Summary

At the moment this includes only a handful of dotfiles. Mostly `bash` shortcuts since
most of my development time is on the command line. But also my `.emacs` which has evolved
a _lot_ over the years, and finally has a place where I can track changes. And finally,
an `.ignore` file which is honored by a few command-line search tools, including Silver
Searcher, which has been the one I've been using as of late.

## Installation

First, clone the repo in your home directory:

```
git clone git@github.com:nikhiltri/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

When starting on a new machine, you might have a lot of stuff already in your bash dotfiles.
To keep all that stuff in place, but add these customizations on top of it all, add this to
the bottom of your `~/.bashrc` so that it runs at the very end your session bootstrap:

```
if [ -f ~/.dotfiles/.bashrc ]; then
    cd ~/.dotfiles
    . .bashrc
    cd ~/
fi
```

This will dip into your dotfiles directory `source` all your custom dotfiles, that come back out
again.

For the remaining dotfiles, check to make sure there aren't any existing files you'll be clobbering,
then add a few symlinks:

```
ln -s ~/.dotfiles/.emacs ~
ln -s ~/.dotfiles/.ignore ~
```

 To refresh your current session, you can:

```
source ~/.bashrc
```

## Maintain

Periodically you should do a `git status` from `~/.dotfiles` just to see if there are any changes
you made that didn't get committed. I set a repeating event in my calendar to check every quarter.
Ooooh! Maybe I'll change the event to coincide with equinoxes and solstices!
