#!/usr/bin/env zsh
# Installs YouCompleteMe for VIM
#
# I'v put this apart from install.sh because YouCompleteMe needs
# downloading a relatively large amount of data, and it takes a
# long time to install. So, maybe you want to install it later.

# I only write scipt for Arch Linux                                           
if ! [[ `uname -r` == *ARCH ]]; then  # if we are not in Arch linux
    echo "Arch linux not detected. I don't compile YCM."
    exit
fi

if ! [[ -d ~/.vim/bundle/YouCompleteMe ]]; then
    echo "YouCompleteMe is not installed by Vundle. I can't compile YCM."
    exit
fi

if [[ -s ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so
    && -s ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]]; then
    echo "YouCompleteMe is already compiled."
    exit
fi

PACKAGES=(git vim python python2 cmake clang)
for PACKAGE in $PACKAGES; do
    if pacman -Q "$PACKAGE" &>/dev/null; then  # if PACKAGE is installed
        echo "Package $PACKAGE is installed"
    else
        sudo pacman -S $PACKAGE                                             
    fi                                                                      
done                                                                        

# Make YCM
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
