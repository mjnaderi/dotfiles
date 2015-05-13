#!/usr/bin/env zsh
# Installs YouCompleteMe for VIM
# Based on https://github.com/Valloric/YouCompleteMe#full-installation-guide

if ! [[ -d ~/.vim/bundle/YouCompleteMe ]]; then
    echo "YouCompleteMe is not installed by Vundle. I can't compile YCM."
    exit
fi

if [[ -s ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so
    && -s ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]]; then
    echo "YouCompleteMe is already compiled."
    exit
fi

if ! [[ `uname -r` == *ARCH ]]; then  # if we are not in Arch linux
    echo -e "Arch linux not detected. You need packages git, vim, python-dev cmake libclang. Compilation might fail. If you have not them, install manually, and re-run.\n"
else
    PACKAGES=(vim python python2 cmake clang)
    for PACKAGE in $PACKAGES; do
        if pacman -Q "$PACKAGE" &>/dev/null; then  # if PACKAGE is installed
            echo "Package $PACKAGE is installed"
        else
            sudo pacman -S $PACKAGE
        fi
    done
fi

# Make YCM
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
