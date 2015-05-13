#!/usr/bin/env zsh

# Set ZSH as default shell
echo -e "\n======= Setting ZSH as default shell."
USER_SHELL=$(getent passwd `whoami` | cut -d: -f7)
if [[ $USER_SHELL == *zsh ]]; then
    echo "Your shell is already ZSH"
else
    chsh -s `which zsh`
fi

# Install some packages in Arch linux
if [[ `uname -r` == *ARCH ]]; then  # if we are in Arch linux
    echo -e "\n======= Arch linux detected. Installing some packages..."
    PACKAGES=(git tig tilda vim)
    for PACKAGE in $PACKAGES; do
        if pacman -Q "$PACKAGE" &>/dev/null; then  # if PACKAGE is installed
            echo "Package $PACKAGE is installed"
        else
            sudo pacman -S $PACKAGE
        fi
    done
fi

git submodule init
git submodule update

# Install Prezto
echo -e "\n======= Installing Prezto"
cd prezto
PREZTO_DIR=`pwd`
echo "------- Cloning Prezto Submodules"
git submodule init
git submodule update
echo "------- Creating symbolic links for Prezto"
setopt EXTENDED_GLOB
rm -rf "${ZDOTDIR:-$HOME}/.zprezto"
ln -svfn $PREZTO_DIR "${ZDOTDIR:-$HOME}/.zprezto"
for rcfile in "$PREZTO_DIR"/runcoms/^README.md(.N); do
    ln -svfn "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
cd ..

# Install base16-shell
echo -e "\n======= Installing Base16-Shell"
rm -rf "${ZDOTDIR:-$HOME}/.base16-shell"
ln -svfn `pwd`"/base16-shell" "${ZDOTDIR:-$HOME}/.base16-shell"

# Install vimrc and Vundle
echo -e "\n======= Installing vimrc and Vundle"
mkdir -p "${ZDOTDIR:-$HOME}/.vim/bundle"
ln -svfn `pwd`"/vundle" "${ZDOTDIR:-$HOME}/.vim/bundle/Vundle.vim"
ln -svfn `pwd`"/vimrc" "${ZDOTDIR:-$HOME}/.vimrc"
ln -svfn `pwd`"/vundlerc" "${ZDOTDIR:-$HOME}/.vundlerc"
echo "------- Installing Vundle packages"
source <(echo "vim +BundleInstall +qall -u vundlerc")
echo "------- Compiling YouCompleteMe for Vim (If installed by Vundle)"
./install-vim-ycm.sh

# Installing Tilda Config File
echo -e "\n======= Installing Tilda Config File"
cp -v `pwd`"/config_tilda" "${ZDOTDIR:-$HOME}/.config/tilda/config_0"
cp -v `pwd`"/config_tilda" "${ZDOTDIR:-$HOME}/.config/tilda/config_1"
cp -v `pwd`"/config_tilda" "${ZDOTDIR:-$HOME}/.config/tilda/config_2"
