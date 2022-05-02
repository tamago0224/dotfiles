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
# install dependecies
if [[ "${distro_name}" == "rockylinux" ]]; then
    sudo dnf -y update
    sudo dnf -y groupinstall "Development Tools"
    sudo dnf -y install ncurses-devel python2-devel python3-devel \
        ruby-devel perl-devel
elif [[ "${distro_name}" == "ubuntu" ]]; then
    sudo apt update
    sudo apt install -y build-essential libncurses5-dev python-dev \
        python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev
else
    echo "distro: ${distro_name} is unsupported"
    exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ ! -d $HOME/src/vim ]; then
    git clone https://github.com/vim/vim $HOME/src/vim
fi

cd $HOME/src/vim
git pull;
./configure --with-features=huge \
--enable-fail-if-missing \
--enable-setfont \
--enable-terminal \
--enable-gtk2-check \
--enable-gnome-check \
--enable-pythoninterp \
--enable-python3interp \
--enable-luainterp \
--enable-rubyinterp \
--enable-fail-if-missing
make && sudo make install

# install vim-plug
${SCRIPT_DIR}/install-vim-plug.sh

