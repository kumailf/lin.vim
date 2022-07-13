#!/usr/bin/env bash

INSTALL=~/.vim/install

$INSTALL/message.sh "install dependencies with dnf"

sudo dnf check-update
$INSTALL/install_or_skip.sh "sudo dnf group install -y \"Development Tools\"" "gcc" "g++"
$INSTALL/install_or_skip.sh "sudo dnf install -y vim" "vim"
$INSTALL/install_or_skip.sh "sudo dnf install -y gvim" "gvim"
$INSTALL/install_or_skip.sh "sudo dnf install -y neovim" "nvim"
$INSTALL/install_or_skip.sh "sudo dnf install -y curl" "curl"
$INSTALL/install_or_skip.sh "sudo dnf install -y wget" "wget"
$INSTALL/install_or_skip.sh "sudo dnf install -y clang" "clang"
$INSTALL/install_or_skip.sh "sudo dnf install -y autoconf" "autoconf"
$INSTALL/install_or_skip.sh "sudo dnf install -y automake" "automake"
$INSTALL/install_or_skip.sh "sudo dnf install -y cmake" "cmake"
$INSTALL/install_or_skip.sh "sudo dnf install -y unzip" "unzip"
$INSTALL/install_or_skip.sh "sudo dnf install -y zip" "zip"
$INSTALL/install_or_skip.sh "sudo dnf install -y bzip2" "bzip2"
$INSTALL/install_or_skip.sh "sudo dnf install -y p7zip p7zip-plugins" "p7zip"

# Python3
$INSTALL/install_or_skip.sh "sudo dnf install -y python3 python3-devel python3-pip python3-docutils" "python3"

# Node
$INSTALL/install_or_skip.sh "sudo dnf install -y nodejs npm" "node"

# Ctags
# Ctags
if ! type "ctags" >/dev/null 2>&1; then
    sudo dnf install -y libseccomp-devel
    sudo dnf install -y jansson-devel
    sudo dnf install -y libyaml-devel
    sudo dnf install -y libxml2-devel
    $INSTALL/message.sh "install universal-ctags from source..."
    $INSTALL/install_universal_ctags.sh
else
    $INSTALL/message_skip.sh "ctags"
fi
