#!/bin/bash
alias ls='ls $LS_OPTIONS --color=auto'
alias ll='ls $LS_OPTIONS -l --color=auto'
alias l='ls $LS_OPTIONS -lA --color=auto'
alias la='ls $LS_OPTIONS -alF --color=auto'
alias cdd='cd -'


# 命令重命名solarized
alias vi="vim"
alias v="vim"
alias e="emacs"
alias es="emacs"
alias gs="git status"
alias ga="git add"
alias gm="git commit -m "
alias gd="git diff"
alias gh="git push"
alias gl="git pull"
alias gc="git checkout"
alias o="nohup nautilus . >/dev/null 2>&1 &"

alias doim="docker image"
alias dops="docker ps"
alias dpa="docker ps -a"
alias doco="docker-compose"
alias dcud="docker-compose up -d"
alias dcdo="docker-compose down"
alias dcps="docker-compose ps"
alias de='doex() { sudo docker exec -it $1 /bin/bash; }; doex'
alias pag='psauxgrep() { echo "sudo ps aux | grep $1"; sudo ps aux | grep $1 }; psauxgrep'

alias mydf="mysql --defaults-file=~/.my.conf"
alias geny="/opt/modules/genymotion/genymotion"
#alias gl="git clone"
#alias gh="git checkout"
