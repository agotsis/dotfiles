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

plugins=(git gitfast git-extras wd)

source $ZSH/oh-my-zsh.sh

export PAGER=less
export EDITOR=vim

# vim mode
# export KEYTIMEOUT=1
# bindkey -v
# bindkey -M <all vi modes> jk vi-movement-mode

# aliases should go in .oh-my-zsh/custom/zshaliases
alias diff='diff -s'

# Local configuration
if [ -f $HOME/.zshlcl ]; then
    source $HOME/.zshlcl
fi

# Local directory hashes
if [ -f $HOME/.zshdirectories ]; then
    source $HOME/.zshdirectories
fi

# Local aliases
if [ -f $HOME/.zshaliases ]; then
    source $HOME/.zshaliases
fi

# iterm2 integration
if [ -f $HOME/.iterm2_shell_integration.zsh ]; then
  export ITERM2_SQUELCH_MARK=1
  source $HOME/.iterm2_shell_integration.zsh
fi

