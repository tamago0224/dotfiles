#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd $HOME
# symlink .gitconfig
if [[ ! -h ${HOME/.gitconfig} ]]; then
    ln -s ${SCRIPT_DIR}/.gitconfig $HOME/.gitconfig
fi

# build vim and install it.
cd ${SCRIPT_DIR}
./install-vim.sh

# symlink .vimrc
if [[ ! -h ${HOME}/.vimrc ]]; then
    ln -s ${SCRIPT_DIR}/.vimrc $HOME/.vimrc
fi

# install asdf and asdf plugin for python
./install-asdf.sh
