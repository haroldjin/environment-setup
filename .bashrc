# {{{ Alias
# ls
alias l='ls -l'
alias ll='ls -alF'  # ls -F suffix with file type indication
alias ls='ls -G'    # ls with color
alias lsh='ls -la | grep " \..*"' # ls all hidden files only with grep

# CLI
alias grep='grep --color=auto'

# Remote
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

#work dir
alias wd="cd $HOME/Documents/works"
alias wl="cd $HOME/Documents/lib"

# bin alias
alias v="vi"
alias vi="vim"

# Docker
alias dubuntu_sys="docker run -i -t --cap-add SYS_PTRACE ubuntu bash"
alias dc="docker"
alias dcS="docker stop"
alias dcc="docker commit"
alias dcC="docker create"
alias dce="docker exec"
alias dcim="docker image"
alias dcis="docker inspect"
alias dcp="docker ps"
alias dcr="docker run"
alias dcs="docker start"

# Git
alias g='git'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gaa='git add -A'
alias gcm='git commit -v'
alias gcma='git commit -v -a'
alias gco='git checkout'
alias gcl='git clone'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias gst='git status'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gl='git pull'
alias gp='git push'
alias glg='git log'
alias glggl='git log --graph --oneline'
alias glgg='git log --graph'
alias glggp='git log --pretty=format:"%h %s" --graph'
alias grv='git remote -v'
# }}}
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

export LIB=$HOME/Documents/lib
export FLUTTER_PATH=$LIB/flutter
export GOPATH=$LIB/go

# Executables
export GOROOT=/usr/local/opt/go/libexec
export LOCAL_BIN=$HOME/bin

export PATH=$LOCAL_BIN:$PATH:$GOROOT/bin:$GOPATH/bin:$GRADLE_BIN::$FLUTTER_PATH/bin
