# {{{ Set up zsh
# Global
ZSH=$HOME/.zsh

# Init Completion
autoload -U compaudit compinit
compinit -u -C -d "${ZSH_COMPDUMP}"

# Configuration Lib
for config_file ($ZSH/lib/*.zsh(N)); do
  source $config_file
done
unset config_file

# Plugins
plugins=(gnu-utils git tmux vi-mode)
is_plugin() {
  local base_dir=$1
  local name=$2
  test -f $base_dir/plugins/$name/$name.plugin.zsh \
    || test -f $base_dir/plugins/$name/_$name
}
for plugin ($plugins); do
  if is_plugin $ZSH $plugin; then
    fpath=($ZSH/plugins/$plugin $fpath)
  else
    echo "[oh-my-zsh] plugin '$plugin' not found"
  fi
done
for plugin ($plugins); do
  if [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
  fi
done

# Prompt
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

shell_colors(){
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i
        if ! (( ($i + 1 ) % 8 )); then
            echo
        fi
    done
}
# }}}
# {{{ Alias
alias dairy='date +%Y-%m-%d''.md'

# ls
alias ls='ls -G'    # ls with color
alias l='ls -lF'
alias ll='ls -alF'  # ls -F suffix with file type indication
alias lsh='ls -la | grep " \..*"' # ls all hidden files only with grep
alias lstr='ls -ltr'

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

alias gdh="git diff HEAD"
alias gdhh="git diff HEAD HEAD^"

# }}}
# {{{ exports
export LIB=$HOME/Documents/lib
export FLUTTER_PATH=$LIB/flutter
export GOPATH=$LIB/go
export GOROOT=/usr/local/opt/go/libexec
export LOCAL_BIN=$HOME/bin
export PATH=~/Library/Python/3.7/bin:$LOCAL_BIN:$PATH:$GOROOT/bin:$GOPATH/bin:$GRADLE_BIN::$FLUTTER_PATH/bin
# }}}
