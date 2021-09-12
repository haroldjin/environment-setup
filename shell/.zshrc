alias lsh='ls -la | grep " \..*"' # ls all hidden files only with grep
alias v="vi"
alias vi="vim"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias gdh="git diff HEAD"
alias gdhh="git diff HEAD^ HEAD"

ZSHRC_LOCAL="$HOME/.zshrc.local"
if [ -e "$ZSHRC_LOCAL" ]; then
    source $ZSHRC_LOCAL
fi