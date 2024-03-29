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

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000000
SAVEHIST=100000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
         git
         gitfast
         wd
         fzf
         pyenv
         #zsh-autosuggestions
         #zsh-syntax-highlighting
        )

# version controlled environment variables for login shells
if [ -f $HOME/.environ ]; then
  source $HOME/.environ
fi

# local environment variables should be in .zshenv

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
if type "direnv" > /dev/null; then
   eval "$(direnv hook zsh)"
fi

source $ZSH/oh-my-zsh.sh
