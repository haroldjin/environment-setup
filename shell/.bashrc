alias lsh='ls -la | grep " \..*"' # ls all hidden files only with grep
alias v="vi"
alias vi="vim"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias gdh="git diff HEAD"
alias gdhh="git diff HEAD^ HEAD"

BASHRC_LOCAL="$HOME/.bashrc.local"
if [ -e "${BASHRC_LOCAL}" ]; then
    source $BASHRC_LOCAL
fi
