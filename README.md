# .dotfiles

At long last, a consolidated place where I can keep the custom configurations
I make on my development machines. I use repo this to keep track of changes I make
over time, and to make working on a new system easier.

## Summary

At the moment this includes only a handful of dot files. Mostly `bash` shortcuts since
most of my development time is on the command line. But also my `.emacs` which has evolved
a _lot_ ever the years, and finally has a place where I can track changes. And finally
an `.ignore` file which is honored by a few command-line search tools, including Silver
Searcher, which has been the one I've been using as of late.

## Installation

First, clone the repo in your home directory:

```
git clone git@github.com:nikhiltri/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

When starting on a new machine, take a look at the existing dot files that are duplicated
from this repo to make sure there's not anything useful that you'd like to keep. If there's
not, `rm` any of those dupe files, then simply run:

```
./install.sh
```

This will create a series of symlinks to the dot files in your home directory. These settings
will automatically load when you open up a new terminal window. To load up all the values in
your current session, you can:

```
source ~/.bashrc
```

## Maintain

Periodically you should do a `git status` from `~/.dotfiles` just to see if there are any changes
you made that didn't get committed. I set a repeating event in my calendar to check every quarter.
Ooooh! Maybe I'll change the event to coincide with equinoxes and solstices!
