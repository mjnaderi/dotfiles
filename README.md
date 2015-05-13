My Dotfiles
===========

This is my dotfiles repository. You can learn more about dotfiles [here](https://dotfiles.github.io/).

Requirements
------------

It is better to install these packages before installing dotfiles.

* Zsh shell
* Tilda (https://github.com/lanoxx/tilda)
* Vim
* Git
* ...


Installation
------------

```sh
chmod +x install.sh
./install.sh
```

After installing, do not move dotfiles repository. If you did that, run `install.sh` once again.

If installing YouCompleteMe plugin for Vim takes a long time and you don't want to install it,
comment out `Plugin 'Valloric/YouCompleteMe'` in `vundlerc`.
