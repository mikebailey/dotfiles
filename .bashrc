# make /usr/local appear before /usr so brew works
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add color to files/folders
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export TERM=xterm-256color

# virtualenv stuff
export WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

# ipython
export ipythonns="ipython notebook --no-browser --pylab inline"
