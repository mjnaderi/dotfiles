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
ln -svfn $PREZTO_DIR "${ZDOTDIR:-$HOME}/.zprezto"
for rcfile in "$PREZTO_DIR"/runcoms/^README.md(.N); do
    ln -svfn "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
cd ..

# Install base16-shell
echo -e "\n\n======= Installing Base16-Shell\n"
rm -rf "${ZDOTDIR:-$HOME}/.base16-shell"
ln -svfn `pwd`"/base16-shell" "${ZDOTDIR:-$HOME}/.base16-shell"

# Install vimrc and Vundle
echo -e "\n\n======= Installing vimrc and Vundle\n"
mkdir -p "${ZDOTDIR:-$HOME}/.vim/bundle"
ln -svfn `pwd`"/vundle" "${ZDOTDIR:-$HOME}/.vim/bundle/Vundle.vim"
ln -svfn `pwd`"/vimrc" "${ZDOTDIR:-$HOME}/.vimrc"
ln -svfn `pwd`"/vundlerc" "${ZDOTDIR:-$HOME}/.vundlerc"
echo -e "\n\n------- Installing Vundle packages\n"
source <(echo "vim +BundleInstall +qall -u vundlerc")

# Installing Tilda Config File
echo -e "\n\n======= Installing Tilda Config File\n"
cp -v `pwd`"/config_tilda" "${ZDOTDIR:-$HOME}/.config/tilda/config_0"
cp -v `pwd`"/config_tilda" "${ZDOTDIR:-$HOME}/.config/tilda/config_1"
cp -v `pwd`"/config_tilda" "${ZDOTDIR:-$HOME}/.config/tilda/config_2"
