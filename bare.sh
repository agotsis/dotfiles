DOTPATH=".config"

git clone --bare git@github.com:agotsis/dotfiles.git $HOME/$DOTPATH
function config {
  /usr/bin/git --git-dir=$HOME/$DOTPATH/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0  ]; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  config checkout $1 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout $1
config config status.showUntrackedFiles no

