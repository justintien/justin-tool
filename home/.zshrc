# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/justintien/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dieter"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source ~/.bash_profile

# for OSX to scan port open.
alias scanport='lsof -n -P -i TCP -s TCP:LISTEN'
alias flushdns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'

# npm
alias npmlsg="npm list -g --depth=0 2>/dev/null"
alias npmls="npm list --depth=0 2>/dev/null"

# brew
alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'

#######
# GFW #
#######

#alias cnpm="npm --registry=https://registry.npm.taobao.org \
#--cache=$HOME/.npm/.cache/cnpm \
#--disturl=https://npm.taobao.org/dist \
#--userconfig=$HOME/.cnpmrc"
alias ccurl="curl --socks5 127.0.0.1:1087"
alias cbrew="ALL_PROXY=socks5://127.0.0.1:1087 brew"

# myip
alias myip='nslookup myip.opendns.com resolver1.opendns.com'
alias weather='curl wttr.in/xiamen'

# drone (please spec by yourself)
# export DRONE_SERVER=
# export DRONE_TOKEN=

# urlencode
function urlencode () {
  local tab="`echo -en "\x9"`"
  local i="$@";
  i=${i//%/%25}  ; i=${i//' '/%20} ; i=${i//$tab/%09}
  i=${i//!/%21}  ; i=${i//\"/%22}  ; i=${i//#/%23}
  i=${i//\$/%24} ; i=${i//\&/%26}  ; i=${i//\'/%27}
  i=${i//(/%28}  ; i=${i//)/%29}   ; i=${i//\*/%2a}
  i=${i//+/%2b}  ; i=${i//,/%2c}   ; i=${i//-/%2d}
  i=${i//\./%2e} ; i=${i//\//%2f}  ; i=${i//:/%3a}
  i=${i//;/%3b}  ; i=${i//</%3c}   ; i=${i//=/%3d}
  i=${i//>/%3e}  ; i=${i//\?/%3f}  ; i=${i//@/%40}
  i=${i//\[/%5b} ; i=${i//\\/%5c}  ; i=${i//\]/%5d}
  i=${i//\^/%5e} ; i=${i//_/%5f}   ; i=${i//\`/%60}
  i=${i//\{/%7b} ; i=${i//|/%7c}   ; i=${i//\}/%7d}
  i=${i//\~/%7e} 
  echo "$i";
}

function docker-clean () {
docker container prune
docker image prune
docker volume prune
}

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
