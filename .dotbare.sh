DOTPATH=${DOTPATH:=".dotconfig"}

function requires {
  command -v $@ >/dev/null 2>&1 || { echo >&2 "I require '$@' but it's not installed. Aborting."; exit 1; }
}

requires git
requires vim
requires zsh
requires curl

# determine which branch to use
if [ $# -eq 0 ]; then
    if [ -d .git ]; then
        echo "No branch provided, defaulting to current branch"
        branch_name="$(git symbolic-ref HEAD 2>/dev/null)"

        branch_name=${branch_name##refs/heads/}
	echo $branch_name
    else
        echo "No branch provided, defaulting to 'master'"
	branch_name='master'
    fi
else
    branch_name=$1
fi

if [ $# -eq 2 ]; then
  repo="https://github.com/agotsis/dotfiles.git"
else
  repo="git@github.com:agotsis/dotfiles.git"
fi

function config {
  /usr/bin/git --git-dir=$HOME/$DOTPATH/ --work-tree=$HOME $@
}
mkdir -p $HOME/.config-backup
config checkout
if [ $? = 0  ]; then
  echo "Checked out config."
else
  echo "Backing up pre-existing dot files."
  config checkout $1 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{}
fi

git clone -b $branch_name --bare $repo $HOME/$DOTPATH || exit 1

config config status.showUntrackedFiles no

# install iterm2 integrations
curl -fLo https://iterm2.com/shell_integration/bash \
    $HOME/.iterm2_shell_integration.bash
curl -fLo https://iterm2.com/shell_integration/zsh \
    $HOME/.iterm2_shell_integration.zsh

# install plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir $HOME/.vim/tmp
# install plugins
vim +'PlugInstall --sync' +qa

echo "export DOTPATH=\"$DOTPATH\"" >> ~/.environlcl

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc

# Use this when not installing mutt
# config ls-files --deleted -z | config update-index --assume-unchanged -z --stdin
config update-index --assume-unchanged .gitconfig

echo "Please update .gitconfig with the correct values."
