#!/bin/bash

# dependencies install
sudo apt-get update
sudo apt-get install --no-install-recommends \
	make build-essential libssl-dev \
	zlib1g-dev libbz2-dev libreadline-dev \
	libsqlite3-dev wget curl llvm \
	libncurses5-dev xz-utils tk-dev \
	libxml2-dev libxmlsec1-dev \
	libffi-dev liblzma-dev

# confirm install pyenv.
if [[ -d ${HOME}/.pyenv ]]; then
    echo "already installed pyenv. skip install pyenv from github"
else
    # install pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

# enable pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc

. ~/.bashrc

# install pyenv update
# confirm pyenv update plugin installed
if [[ -d ${HOME} ]]; then
    git clone https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
fi
