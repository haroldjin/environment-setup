# {{{ Set up zsh
# Global
ZSH=.dotfiles/zsh

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

# Utils
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
# Personal & Git
alias dairy="vi $(date +%Y-%m-%d).md"
alias gdh="git diff HEAD"
alias gdhh="git diff HEAD^ HEAD"

# Color enhancements
alias grep='grep --color=auto'
alias ls='ls --color -F'
alias ll='ls -alF --color'

# helpers and shortcuts
alias lsh='ls -la | grep " \..*"' # ls all hidden files only with grep
alias v="vim"
alias vi="vim"
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# }}}
# {{{ PATH export
if [[ -z $TMUX ]]; then
    export LOCAL_BIN=$HOME/bin
    export PATH=$LOCAL_BIN:$PATH
fi
# }}}
