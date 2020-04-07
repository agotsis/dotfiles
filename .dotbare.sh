DOTPATH=".config"

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

git clone -b $branch_name --bare git@github.com:agotsis/dotfiles.git $HOME/$DOTPATH
function config {
  /usr/bin/git --git-dir=$HOME/$DOTPATH/ --work-tree=$HOME $@
}
mkdir -p $HOME/.config-backup
config checkout
if [ $? = 0  ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  config checkout $1 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{}
fi;

config config status.showUntrackedFiles no

# install plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
vim +'PlugInstall --sync' +qa

