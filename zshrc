# make usr/ocal appear before /usr so brew works
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/dotfiles/oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="prose"

export EDITOR="vim"
bindkey -v 

# python/virtualenv
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME
    source /usr/local/bin/virtualenvwrapper.sh
fi

# python/anaconda
if [ -d ~/anaconda ]; then
    function workonconda { 
        if [ "" = "$1" ]; 
        then
            ls ~/anaconda/envs;
        else
            source ~/anaconda/bin/activate $1;
        fi
    }

    function deactivateconda { source ~/anaconda/bin/deactivate; }
fi

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

setopt AUTO_CD

# Bash shortcuts
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -alrth'

# ipython notebook shortcuts
alias ipythonns='ipython notebook --no-browser --pylab inline'
alias ec2ipythonns='ipython notebook --no-browser --ip=`curl -s http://169.254.169.254/latest/meta-data/public-hostname` --pylab inline'

# Git shortcuts
function com { git commit -a -m $1; }
alias acom='git commit -a --amend'
function gc { git checkout $1; }
alias gs='git status'
alias gb='git branch'
alias push='git push origin master'
alias gp='git pull --rebase'
alias gf='git fetch upstream'
alias gr='git rebase upstream/master'

# Need to investigate what this is doing and document

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/dotfiles/oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Automatically quote globs in URL and remote references
# __remote_commands=(scp rsync)
# autoload -U url-quote-magic
# zle -N self-insert url-quote-magic
# zstyle -e :urlglobber url-other-schema '[[ $__remote_commands[(i)$words[1]] -le ${#__remote_commands} ]] && reply=("*") || reply=(http https ftp)'
