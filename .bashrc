# {{{ Alias
# ls
alias l='ls -l'
alias ll='ls -alF'  # ls -F suffix with file type indication
alias ls='ls -G'    # ls with color
alias lsh='ls -la | grep " \..*"' # ls all hidden files only with grep

# CLI
alias grep='grep --color=auto'

# Remote
alias socks5='ssh -D 8123 -f -C -q -N home'
alias opip4="lsof -Pnl +M -i4"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias netListen='lsof -i | grep LISTEN'

#work dir
alias wd="cd $HOME/Documents/works"
alias wl="cd $HOME/Documents/lib"

# bin alias
alias v="vi"
alias vi="vim"
alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"

# Docker
alias dubuntu_sys="docker run -i -t  --cap-add SYS_PTRACE ubuntu bash"
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
alias glgp='git log --pretty=format:"%h %s" --graph'
alias grv='git remote -v'
# }}}
if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export GOROOT=/usr/local/opt/go/libexec
export LIB=$HOME/Documents/lib
export FLUTTER_PATH=$LIB/flutter
export GOPATH=$LIB/go
export GRADLE_BIN=$HOME/.gradle/wrapper/dists/gradle-4.4-bin/bgaq7vklkazwgxox0hdadxbvi/gradle-4.4/bin
export LOCAL_BIN=$HOME/bin
export FASTLANE_BIN=$HOME/.fastlane/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
export PATH=$LOCAL_BIN:$GOROOT/bin:$GOPATH/bin:$FASTLANE_BIN:$PATH:$GRADLE_BIN:$JAVA_HOME/bin:$FLUTTER_PATH/bin
