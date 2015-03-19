#!/usr/bin/env zsh

CURRENT_DIR=`pwd`

setopt EXTENDED_GLOB
for rcfile in "$CURRENT_DIR"/prezto/runcoms/^README.md(.N); do
    ln -svf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
