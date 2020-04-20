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
    PACKAGES=(git tig tilda xclip htop)
    for PACKAGE in $PACKAGES; do
        if pacman -Q "$PACKAGE" &>/dev/null; then  # if PACKAGE is installed
            echo "Package $PACKAGE is installed"
        else
            sudo pacman -S $PACKAGE
        fi
    done
    if ! pacman -Q vim &>/dev/null && ! pacman -Q gvim &>/dev/null; then
        echo "Vim or Gvim is not installed. Installing Gvim"
        sudo pacman -S gvim
    fi
fi

git submodule init
git submodule update

# Install Prezto
echo -e "\n======= Install Prezto"
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

# Install Desk (https://github.com/jamesob/desk)
echo -e "\n======= Install Desk"
cd desk
DESK_DIR=`pwd`
rm -rf "${ZDOTDIR:-$HOME}/.zdesk"
ln -svfn $DESK_DIR "${ZDOTDIR:-$HOME}/.zdesk"
cd ..

# Install base16-shell
echo -e "\n======= Install Base16-Shell"
rm -rf ~/.base16-shell
ln -svfn `pwd`"/base16-shell" ~/.base16-shell

# Install vimrc and Vundle
echo -e "\n======= Install vimrc and Vundle"
mkdir -p ~/.vim/bundle
ln -svfn `pwd`/vundle ~/.vim/bundle/Vundle.vim
ln -svfn `pwd`/vimrc ~/.vimrc
ln -svfn `pwd`/vundlerc ~/.vundlerc
echo "------- Install Vundle packages"
source <(echo "vim +BundleInstall +qall -u vundlerc")
if [[ -d ~/.vim/bundle/YouCompleteMe ]]; then
    echo "------- YouCompleteMe for Vim is installed by Vundle. Compiling YouCompleteMe..."
    if [[ -s ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so
        && -s ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]]; then
        echo "YouCompleteMe is already compiled."
    else
        ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer --system-libclang --gocode-completer
    fi
    ln -svfn `pwd`/default_ycm_extra_conf.py ~/.ycm_extra_conf
fi

# Installing Tilda Config File
#echo -e "\n======= Installing Tilda Config File"
#cp -v `pwd`"/config_tilda" ~/.config/tilda/config_0
#cp -v `pwd`"/config_tilda" ~/.config/tilda/config_1
#cp -v `pwd`"/config_tilda" ~/.config/tilda/config_2


# Install pyenv, pyenv-virtualenv
echo -e "\n======= Install/Update pyenv and pyenv-virtualenv"
PYENV_INSTALL_PATH="$HOME/.pyenv"
PYENV_VIRTUALENV_INSTALL_PATH="${PYENV_INSTALL_PATH}/plugins/pyenv-virtualenv"
if [[ -d $PYENV_INSTALL_PATH ]]; then
  echo "pyenv found. updating..."
  git -C $PYENV_INSTALL_PATH pull -q
else
  echo "pyenv not found. installing..."
  git clone https://github.com/pyenv/pyenv.git $PYENV_INSTALL_PATH
fi
if [[ -d $PYENV_VIRTUALENV_INSTALL_PATH ]]; then
  echo "pyenv-virtualenv found. updating..."
  git -C $PYENV_VIRTUALENV_INSTALL_PATH pull -q
else
  echo "pyenv-virtualenv not found. installing..."
  git clone https://github.com/pyenv/pyenv-virtualenv.git $PYENV_VIRTUALENV_INSTALL_PATH
fi