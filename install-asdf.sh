#!/bin/bash

function check_distro() {
    . /etc/os-release
    distro_name="unknown"
    case "${NAME}" in
        "Rocky Linux" ) distro_name="rockylinux" ;;
        "Ubuntu" ) distro_name="ubuntu" ;;
    esac
    echo "${distro_name}"
}

distro_name=$(check_distro)
# dependencies install
if [[ "${distro_name}" == "rockylinux" ]]; then
    sudo dnf -y update
    sudo dnf -y install curl git \
        make gcc zlib-devel bzip2 bzip2-devel readline-devel \
        sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel
elif [[ "${distro_name}" == "ubuntu" ]]; then
    sudo apt-get update
    sudo apt-get install --no-install-recommends curl git \
        make build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
        libffi-dev liblzma-dev
else
    echo "distro: ${distro_name} is unsupported"
    exit 1
fi

# check to see if asdf is installed.
if [[ -d ${HOME}/.asdf ]]; then
    echo "already installed asdf. skip install asdf from github"
else
    # install asdf
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
fi

# enable pyenv
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

. ~/.bashrc

# install asdf plugin for python
asdf plugin-add python 
