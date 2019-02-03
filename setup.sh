#!/bin/sh

# constants
cNone='\033[00m'
cRed='\033[01;31m'
cGreen='\033[01;32m'
cYellow='\033[01;33m'
cPurple='\033[01;35m'
cCyan='\033[01;36m'
cWhite='\033[01;37m'
cBold='\033[1m'
cUnderline='\033[4m'
OS_nAME=`uname -s`

# functions
command_exists () {
    type "$1" &> /dev/null ;
}

installedHomeBrew=false

# Flow
if [ "$OS_nAME" == "Darwin" ]; then
    echo "Do you want to set up ${cBold}Homebrew?${cNone}[y/n]"
    read isSetupHomebrew
    if [ "$isSetupHomebrew" == "y" ]; then
        echo setting up homebrew
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        if [ $? -eq 0 ]; then
            echo brew set up successfully
            installedHomeBrew=true
        else
            echo brew set up failed, continuing setting up the environment
        fi
    else
        echo skipping setting up homebrew
    fi
elif [ "$OS_nAME" == "Linux" ]; then
    echo linux
    # Linux specific setups
else
    exit 1
fi

if [ "$installedHomeBrew" = true ]; then
    declare -a commandsToInstall=("python3" "nvm", "yarn", "npm")

    for command in "${commandsToInstall[@]}"; do
        command_exists "$command"
        if [ $? -eq 1 ]; then
            echo command $command doesn\'t exist do you want to install[y/n]?
            read isInstall
            if [ "$isInstall" == "y" ]; then
                echo installing command $command
                brew install $command
            fi
        fi
    done

    echo "Do you want to install ${cBold}${cYellow}vim with python3?${cNone}[y/n]"
    read isSetupVim

    if [ "$isSetupVim" == "y" ]; then
        echo Installing vim with python3 using brew
        brew install vim --with-python3
        if [ $? eq 0 ]; then
            echo vim installed successful
        else
            echo error installing vim
            exit 1
        fi
    else
        echo skipping installing vim with python3
    fi
fi

echo setting up bash profile, git prompt \& completion
ln -sfn `pwd`/.bashrc ~/.bash_profile
if [ $? -eq 0 ]; then
    echo bash set up successful
else
    echo error setting up bash profile
    exit 1
fi

echo setting up vimrc and vim libraries
ln -sfn `pwd`/vim/vimrc ~/.vimrc && ln -sfn `pwd`/vim ~/.vim
if [ $? -eq 0 ]; then
    echo vim setup successful
else
    echo error setting up vim
    exit 1
fi

echo "${cGreen}setup completed!${cNone}"
