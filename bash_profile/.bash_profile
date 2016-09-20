if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
[ -f ~/.git-bash-completion.sh ] && . ~/.git-bash-completion.sh

export CLICOLOR='true'
# export LSCOLORS='gxfxcxdxcxegedabagacad'
export LSCOLORS='exfxcxdxbxegedabagacad'

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

alias l='ls -CF'
alias la='ls -A'
alias ls='ls -vG'
alias ll='ls -alF'
alias vi='vim'

# for OSX to scan port open.
alias scanport='lsof -n -P -i TCP -s TCP:LISTEN'

# scp
alias scplinode='scp -p 22 zarqarwi@97.107.142.185:'

# docker machine active
eval $(docker-machine env dev)


# colorful man page
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[0;34m'
export LESS_TERMCAP_md=$'\E[0;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[0;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[0;33m'

# git branch last commit display
function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

PS1="[\[\033[1;32m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ " 
