#!/usr/bin/env zsh

git submodule init
git submodule update

# Install Prezto
echo -e "\n\n======= Installing Prezto\n"
cd prezto
echo -e "\n\n------- Cloning Prezto Submodules\n"
git submodule init
git submodule update
echo -e "\n\n------- Creating symbolic links for Prezto\n"
CURRENT_DIR=`pwd`
setopt EXTENDED_GLOB
ln -svf prezto "${ZDOTDIR:-$HOME}/.zprezto"
for rcfile in "$CURRENT_DIR"/runcoms/^README.md(.N); do
    ln -svf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
cd ..



