#!/usr/bin/env zsh

# Set ZSH as default shell
echo -e "\n\n======= Setting ZSH as default shell.\n"
chsh -s `which zsh`

git submodule init
git submodule update

# Install Prezto
echo -e "\n\n======= Installing Prezto\n"
cd prezto
PREZTO_DIR=`pwd`
echo -e "\n\n------- Cloning Prezto Submodules\n"
git submodule init
git submodule update
echo -e "\n\n------- Creating symbolic links for Prezto\n"
setopt EXTENDED_GLOB
rm -rf "${ZDOTDIR:-$HOME}/.zprezto"
ln -svf $PREZTO_DIR "${ZDOTDIR:-$HOME}/.zprezto"
for rcfile in "$PREZTO_DIR"/runcoms/^README.md(.N); do
    ln -svf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
cd ..

# Install base16-shell
rm -rf "${ZDOTDIR:-$HOME}/.base16-shell"
ln -svf `pwd`"/base16-shell" "${ZDOTDIR:-$HOME}/.base16-shell"



