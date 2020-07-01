# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git gitfast git-extras wd sudo colored-man-pages colorize
         command-not-found)

source $ZSH/oh-my-zsh.sh

# vim mode
# export KEYTIMEOUT=1
# bindkey -v
# bindkey -M <all vi modes> jk vi-movement-mode

export PAGER=less
export EDITOR=vim

# local environment variables
if [ -f $HOME/.environ ]; then
  source $HOME/.environ
fi

# version controlled aliases
if [ -f $HOME/.zshaliases ]; then
    source $HOME/.zshaliases
fi

# Local configuration
if [ -f $HOME/.zshlcl ]; then
    source $HOME/.zshlcl
fi

# Local directory hashes
if [ -f $HOME/.zshdirectorieslcl ]; then
    source $HOME/.zshdirectorieslcl
fi

# Local aliases
if [ -f $HOME/.zshaliaseslcl ]; then
    source $HOME/.zshaliaseslcl
fi

# iterm2 integration
if [ -f $HOME/.iterm2_shell_integration.zsh ]; then
  export ITERM2_SQUELCH_MARK=1
  source $HOME/.iterm2_shell_integration.zsh
fi

# direnv hook
eval "$(direnv hook zsh)"

