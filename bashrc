# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin"

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.5/bin"

# Homebrew
PATH="$PATH:/usr/local/bin"

# Virtualenv/VirtualenvWrapper
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# source /Library/Frameworks/Python.framework/Versions/3.5/bin/virtualenvwrapper.sh

# for c0
PATH="$PATH:/opt/cc0/bin"

# MacPorts Installer addition on 2016-04-01_at_20:41:49: adding an appropriate PATH variable for use with MacPorts.
PATH="$PATH:/opt/local/bin:/opt/local/sbin"

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH
