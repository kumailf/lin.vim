#!/usr/bin/env bash

INSTALL=~/.vim/install

$INSTALL/message.sh "install dependencies with apt"

sudo apt-get update
$INSTALL/install_or_skip.sh "sudo apt-get install -y build-essential" "gcc"
$INSTALL/install_or_skip.sh "sudo apt-get install -y vim" "vim"
$INSTALL/install_or_skip.sh "sudo apt-get install -y libcanberra-gtk-module vim-gtk" "gvim"
$INSTALL/install_or_skip.sh "sudo apt-get install -y neovim" "nvim"
$INSTALL/install_or_skip.sh "sudo apt-get install -y curl" "curl"
$INSTALL/install_or_skip.sh "sudo apt-get install -y wget" "wget"
$INSTALL/install_or_skip.sh "sudo apt-get install -y autoconf" "autoconf"
$INSTALL/install_or_skip.sh "sudo apt-get install -y automake" "automake"
$INSTALL/install_or_skip.sh "sudo apt-get install -y cmake" "cmake"
$INSTALL/install_or_skip.sh "sudo apt-get install -y clang" "clang"
$INSTALL/install_or_skip.sh "sudo apt-get install -y bzip2" "bzip2"
$INSTALL/install_or_skip.sh "sudo apt-get install -y unzip" "unzip"
$INSTALL/install_or_skip.sh "sudo apt-get install -y zip" "zip"
$INSTALL/install_or_skip.sh "sudo apt-get install -y p7zip-full" "7z"

# Python3
$INSTALL/install_or_skip.sh "sudo apt-get install -y python3 python3-dev python3-venv python3-pip python3-docutils" "python3"
$INSTALL/install_or_skip.sh "sudo apt-get install -y python3 python3-dev python3-venv python3-pip python3-docutils" "pip3"

# Node
if ! type "node" > /dev/null; then
    $INSTALL/message.sh "install nodejs from deb.nodesource.com..."
    curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    $INSTALL/message_skip.sh "node"
fi


# Ctags
if ! type "ctags" >/dev/null 2>&1; then
    sudo apt-get install -y libseccomp-dev
    sudo apt-get install -y libjansson-dev
    sudo apt-get install -y libyaml-dev
    sudo apt-get install -y libxml2-dev
    $INSTALL/message.sh "install universal-ctags from source..."
    $INSTALL/install_universal_ctags.sh
else
    $INSTALL/message_skip.sh "ctags"
fi
