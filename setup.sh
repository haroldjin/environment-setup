#prompt_select_read!/bin/sh

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
OS_NAME=`uname -s`
VUNDLE_PATH='https://github.com/VundleVim/Vundle.vim.git'

# Prompts
prompt_bold(){
    echo "${STYLE_NONE} ${FONT_BOLD}$1${STYLE_NONE}"
}
prompt_error(){
    echo "${COLOR_RED}$1${STYLE_NONE}"
}

prompt_info(){
    echo "${COLOR_GREEN}$1${STYLE_NONE}"
}

prompt_select_print(){
    echo "${COLOR_PURPLE}$1${STYLE_NONE}${COLOR_GREEN} $2${STYLE_NONE}"
}
prompt_select(){
    echo "${COLOR_PURPLE}$1${STYLE_NONE}${COLOR_GREEN} [y/n]${STYLE_NONE}"
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
    declare -a commandsToInstall=("python3" "yarn" "npm" "cmake")

    for command in "${commandsToInstall[@]}"; do
        command_exists "$command"
        if [ $? -eq 1 ]; then
            prompt_select "command $command doesn't exist do you want to install"
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
        if [ $? eq 0 ]; then
            prompt_info "vim installed successful"
        fi
    elif [ "$vimSelect" == 'm' ]; then
        prompt_info "Installing `prompt_bold "macVim"` using brew"
        brew install macvim
        if [ $? eq 0 ]; then
            prompt_info "macVim installed successful"
        fi
    else
        prompt_info "skipping vim installation"
    fi
}

setup_bash(){
    prompt_info "setting up bash profile"
    ln -sfn `pwd`/.bashrc ~/.bash_profile
    if [ $? -eq 0 ]; then
        prompt_info "bash set up successful"
    else
        prompt_error "error setting up bash profile"
        exit 1
    fi
    echo
}


setup_vim(){
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

    prompt_select "do you want to set up YouCompleteMe?"
    if [ $? == 1 ]; then
        python `pwd`/vim/bundle/YouCompleteMe/install.py --all
    fi
    echo
}

setup_mac(){
    prompt_select "Do you want to set up `prompt_bold "Homebrew"`"
    if [ $? == 1 ]; then
        prompt_info "setting up homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if [ $? -eq 0 ]; then
            prompt_info "brew set up successfully"
            homerbew_setup
        else
            prompt_error "brew set up failed, continuing setting up the environment"
        fi
    else
        prompt_error "skipping setting up homebrew"
    fi
}

# MAIN
if [ "$OS_NAME" == "Darwin" ]; then
    setup_mac
elif [ "$OS_NAME" == "Linux" ]; then
    prompt_error "$OS_NAME is not yet implemented for OS specific packages"
    # Linux specific setups
else
    prompt_error "$OS_NAME is not yet implemented for OS specific packages and for bash and vim"
    exit 1
fi

# Setup vim now
setup_bash
setup_vim

prompt_info "setup completed!"
