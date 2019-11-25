#!/bin/bash

if which tput >/dev/null 2>&1; then
    colors=$(tput colors)
fi

if [ -t 1 ] && [ -n "$colors" ] && [ "$colors" -ge 8 ]; then
    # constants
    STYLE_NONE='\033[00m'
    COLOR_RED='\033[01;31m'
    COLOR_GREEN='\033[01;32m'
    COLOR_YELLOW='\033[01;33m'
    COLOR_PURPLE='\033[01;35m'
    COLOR_CYAN='\033[01;36m'
    COLOR_WHITE='\033[01;37m'
    FONT_BOLD='\033[1m'
    FONT_UNDERLINE='\033[4m'
else
    STYLE_NONE=''
    COLOR_RED=''
    COLOR_GREEN=''
    COLOR_YELLOW=''
    COLOR_PURPLE=''
    COLOR_CYAN=''
    COLOR_WHITE=''
    FONT_BOLD=''
    FONT_UNDERLINE=''
fi

OS_NAME=`uname -s`
VUNDLE_PATH='https://github.com/VundleVim/Vundle.vim.git'

# Prompts with enable backslash interpretation
prompt_bold(){
    echo -e "${STYLE_NONE} ${FONT_BOLD}$1${STYLE_NONE}"
}

prompt_error(){
    echo -e "${COLOR_RED}$1${STYLE_NONE}"
}

prompt_info(){
    echo -e "${COLOR_GREEN}$1${STYLE_NONE}"
}

prompt_select_print(){
    echo -e "${COLOR_PURPLE}$1${STYLE_NONE}${COLOR_GREEN} $2${STYLE_NONE}"
}

prompt_select_return(){
    echo -e "${COLOR_PURPLE}$1${STYLE_NONE}${COLOR_GREEN} [y/n]${STYLE_NONE}"
    read isYes
    if [ "$isYes" == "y" ]; then
        return 1
    else
        return 0
    fi
}

# functions
command_exists () {
    type "$1" &> /dev/null ;
}

homerbew_setup(){
    declare -a commandsToInstall=("python3" "yarn" "npm" "cmake" "tmux" "zsh")

    for command in "${commandsToInstall[@]}"; do
        command_exists "$command"
        if [ $? -eq 1 ]; then
            prompt_select_return "command $command doesn't exist do you want to install"
            if [ "$?" = 1 ]; then
                prompt_info "installing command $command"
                brew install $command
            fi
        fi
    done

    prompt_select_print "Do you want to install `prompt_bold "vim"`" "[m/v/n]${STYLE_NONE} - m for macvim, v for vim, n to skip"
    read vimSelect
    if [  "$vimSelect" == 'v' ]; then
        prompt_info "Installing `prompt_bold "vim with python3"` using brew"
        brew install vim
        if [ $? -eq 0 ]; then
            prompt_info "vim installed successful"
        fi
    elif [ "$vimSelect" == 'm' ]; then
        prompt_info "Installing `prompt_bold "macVim"` using brew"
        brew install macvim
        if [ $? -eq 0 ]; then
            prompt_info "macVim installed successful"
        fi
    else
        prompt_info "skipping vim installation"
    fi
}

setup_bash(){
    prompt_info "setting up bash profile"
    if [ -z $1 ] || [ $1 != "bash" ]; then
        prompt_select_return "Shell $1 is not bash, do you want to change your default shell to bash"
        if [ $? == 1 ]; then
            prompt_info "changing shell from $1 to bash"
            chsh -s $(which bash)
        fi
    fi

    ln -sfn `pwd`/shell/.bashrc ~/.bash_profile
    if [ $? -eq 0 ]; then
        prompt_info "bash set up successful"
    else
        prompt_error "error setting up bash profile"
        exit 1
    fi
    echo
}

setup_zsh(){
    prompt_info "setting up zsh profile"
    if [ -z $1 ] || [ $1 != "zsh" ]; then
        prompt_select_return "Shell $1 is not zsh, do you want to change your default shell to zsh"
        if [ $? == 1 ]; then
            prompt_info "changing shell from $1 to zsh"
            chsh -s $(which zsh)
        fi
    fi

    ln -sfn `pwd`/shell/.zshrc ~/.zshrc && ln -sfn `pwd`/zsh ~/.zsh

    if [ $? -eq 0 ]; then
        prompt_info "zsh set up successful"
    else
        prompt_error "error setting up zsh profile"
        exit 1
    fi
    echo
}



setup_mac(){
    prompt_select_return "Do you want to set up `prompt_bold "mac"`"
    if [ $? == 1 ]; then
        prompt_info "setting up homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if [ $? -eq 0 ]; then
            prompt_info "mac set up successfully"
            homerbew_setup
        else
            prompt_error "mac set up failed, continuing setting up the environment"
        fi
    else
        prompt_error "skipping setting up mac"
    fi
}

setup_linux(){
    declare -a commandsToInstall=("python3" "yarn" "npm" "cmake" "tmux", "zsh")

    local PACKAGE_COMMAND=""
    if  command_exists apt-get; then
        PACKAGE_COMMAND="apt-get"
    elif command_exists yum; then
        PACKAGE_COMMAND="yum"
    else
        prompt_error "Unable to find package command"
        return 1
    fi

    prompt_select_return "Detected package command $PACKAGE_COMMAND. Do you want to set up `prompt_bold "linux"`"
    if [ $? == 0 ]; then
        prompt_error "skipping setting up linux"
        return 1
    fi

    for command in "${commandsToInstall[@]}"; do
        if ! command_exists "$command"; then
            prompt_select_return "command $command doesn't exist do you want to install"
            if [ "$?" = 1 ]; then
                prompt_info "installing command $command"
                sudo $PACKAGE_COMMAND install $command
            fi
        fi
    done

    prompt_select_print "Do you want to install `prompt_bold "vim"`" "[v/n]${STYLE_NONE} - v for vim, n to skip"
    read vimSelect
    if [  "$vimSelect" == 'v' ]; then
        prompt_info "Installing `prompt_bold "vim"` using $PACKAGE_COMMAND"
        sudo $PACKAGE_COMMAND install vim
        if [ $? -eq 1]; then
            prompt_error "unable to find package manager to install vim"
            return 1
        fi
    else
        prompt_info "skipping vim installation"
    fi
    return 0
}

setup_shell(){
    prompt_select_print "Do you want to setup `prompt_bold "bash or zsh"`" "[b/z/n]${STYLE_NONE} - b for bash, z for zsh, n to skip"
    read shellSelect
    cur_shell=$(basename $SHELL)
    if [  "$shellSelect" == 'b' ]; then
        setup_bash $cur_shell
    elif [ "$shellSelect" == 'z' ]; then
        setup_zsh $cur_shell
    else
        prompt_info "skipping shell installation"
    fi
}

setup_vim(){
    prompt_select_return "Do you want to set up vim?"
    if [ $? == 0 ]; then
        return 0
    fi
    prompt_info "setting up vimrc and vim libraries"
    ln -sfn `pwd`/vim/vimrc ~/.vimrc && ln -sfn `pwd`/vim ~/.vim
    if [ $? -eq 0 ]; then
        prompt_info "vim folder setup successful"
    else
        prompt_info "error setting up vim"
        exit 1
    fi

    prompt_info "cloning vundle to vim directory"
    if [ ! -d `pwd`/vim/bundle/Vundle.vim ]; then
        git clone ${VUNDLE_PATH} `pwd`/vim/bundle/Vundle.vim
    fi

    prompt_info "install plugins for vim"
    vim +PluginInstall +qall
    echo
}

setup_tmux(){
    prompt_select_return "Do you want to set up tmux?"
    if [ $? == 0 ]; then
        return 0
    fi

    if [ ! -e ./tmux/plugins/tpm ]; then
        prompt_info "setting up tmux"
        git clone https://github.com/tmux-plugins/tpm ./tmux/plugins/tpm
        if [ $? -eq 0 ]; then
            prompt_info "tmux git download successful"
        else
            prompt_info "error setting up tmux"
            exit 1
        fi
    fi

    ln -sfn `pwd`/tmux/.tmux.conf ~/.tmux.conf && ln -sfn `pwd`/tmux ~/.tmux && ~/.tmux/plugins/tpm/scripts/install_plugins.sh
    if [ $? -eq 0 ]; then
        prompt_info "tmux setup successful"
    else
        prompt_info "error setting up tmux"
        exit 1
    fi

}

# ======= MAIN =======
## Setup dependencies
if [ "$OS_NAME" == "Darwin" ]; then
    setup_mac
elif [ "$OS_NAME" == "Linux" ]; then
    setup_linux
    # prompt_error "$OS_NAME is not yet implemented for OS specific packages"
    # Linux specific setups
else
    prompt_error "$OS_NAME is not yet implemented for OS specific packages and for bash and vim"
    exit 1
fi

setup_shell
setup_vim
setup_tmux

prompt_info "setup completed!"
