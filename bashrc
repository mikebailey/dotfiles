# make /usr/local appear before /usr so brew works
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# RubyGem binaries
export PATH="$PATH:/usr/local/Cellar/ruby/2.1.1_1/bin:/usr/local/Cellar/ruby/2.1.0/bin"

# Add color to files/folders
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export TERM=xterm-256color

# python/virtualenv
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME
    source /usr/local/bin/virtualenvwrapper.sh
    export ipythonns="ipython notebook --no-browser --pylab inline"
fi
