#!/usr/bin/env zsh

git submodule init
git submodule update

# Install Prezto
echo -e "\n\nInstalling Prezto\n"
cd prezto
git submodule init
git submodule update
CURRENT_DIR=`pwd`
setopt EXTENDED_GLOB
for rcfile in "$CURRENT_DIR"/runcoms/^README.md(.N); do
    ln -svf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
cd ..


