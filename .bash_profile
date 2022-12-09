if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

if [ -f $HOME/.iterm2_shell_integration.bash ]; then
  source $HOME/.iterm2_shell_integration.bash
fi


export PATH="$HOME/.poetry/bin:$PATH"
. "$HOME/.cargo/env"
