#!/usr/bin/env bash

set -eo pipefail

VIM_HOME=$HOME/.vim
CONFIG_HOME=$HOME/.config
NVIM_HOME=$CONFIG_HOME/nvim
INSTALL_HOME=$VIM_HOME/install
TEMPLATE_HOME=$VIM_HOME/template
OS="$(uname -s)"

function platform_dependency() {
    case "$OS" in
        Linux)
            if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
                $INSTALL_HOME/pacman.sh "$INSTALL_HOME"
            elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
                $INSTALL_HOME/dnf.sh "$INSTALL_HOME"
            elif [ -f "/etc/gentoo-release" ]; then
                $INSTALL_HOME/emerge.sh "$INSTALL_HOME"
            else
                # assume apt
                $INSTALL_HOME/apt.sh "$INSTALL_HOME"
            fi
            ;;
        FreeBSD)
            $INSTALL_HOME/pkg.sh "$INSTALL_HOME"
            ;;
        NetBSD)
            $INSTALL_HOME/pkgin.sh "$INSTALL_HOME"
            ;;
        OpenBSD)
            $INSTALL_HOME/pkg_add.sh "$INSTALL_HOME"
            ;;
        Darwin)
            $INSTALL_HOME/brew.sh "$INSTALL_HOME"
            ;;
        *)
            $INSTALL_HOME/message.sh "OS $OS is not supported, exit..."
            exit 1
            ;;
    esac
}

function rust_dependency() {
    if ! type "rustc" >/dev/null 2>&1; then
        $INSTALL_HOME/install_or_skip.sh "curl https://sh.rustup.rs -sSf | sh -s -- -y" "rustc"
    fi
    source $HOME/.cargo/env
    cargo install ripgrep
    cargo install fd-find
    cargo install --lock bat
}

function pip3_dependency() {
    sudo pip3 install pyOpenSSL pep8 flake8 pylint yapf chardet neovim pynvim cmakelang cmake-language-server click
}

function npm_dependency() {
    sudo npm install -g yarn prettier neovim
}

function guifont_dependency() {
    if [ "$OS" == "Darwin" ]; then
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
    else
        mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
        local font_file=Hack.zip
        local font_version=v2.1.0
        local font_download_url=https://github.com/ryanoasis/nerd-fonts/releases/download/$font_version/$font_file
        if [ ! -f $font_file ]; then
            curl $font_download_url -o $font_file
            if [ $? -ne 0 ]; then
                $INSTALL_HOME/message.sh "download $font_file failed, skip..."
            fi
        fi
        unzip -o $font_file
    fi
}

function install_templates() {
    cp $TEMPLATE_HOME/plugin-template.vim $VIM_HOME/plugin.vim
    cp $TEMPLATE_HOME/coc-settings-template.json $VIM_HOME/coc-settings.json
    cp $TEMPLATE_HOME/setting-template.vim $VIM_HOME/setting.vim
}

function install_vimrc() {
    if [ -f $HOME/.vimrc ]; then
        mv $HOME/.vimrc $HOME/.vimrc.$(date +"%Y-%m-%d.%H-%M-%S")
    fi
    ln -s $VIM_HOME/lin.vim $HOME/.vimrc
}

function install_nvim_init() {
    mkdir -p $CONFIG_HOME
    if [ -d $NVIM_HOME ]; then
        mv $NVIM_HOME $CONFIG_HOME/nvim.$(date +"%Y-%m-%d.$H-%M-%S")
    fi
    ln -s $VIM_HOME $NVIM_HOME
    if [ -f $NVIM_HOME/init.vim ]; then
        rm $NVIM_HOME/init.vim
    fi
    ln -s $NVIM_HOME/lin.vim $NVIM_HOME/init.vim
}

function install_vim_plugin() {
    vim -E -c "PlugInstall" -c "qall"
}

function install_nvim_plugin() {
    nvim -E -c "PlugInstall" -c "qall"
}

function main() {
    # install dependencies
    platform_dependency
    rust_dependency
    pip3_dependency
    npm_dependency
    guifont_dependency

    # install files
    install_templates
    install_vimrc
    install_nvim_init

    # install plugins
    install_vim_plugin
    install_nvim_plugin
}

main
