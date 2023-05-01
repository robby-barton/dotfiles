#! /usr/bin/env bash
PWD=$(pwd)

function safeCopyConfig() {
	if [ -z "${1}" ]; then
		return
	fi

	expectedName=~/.${1}
	if [ -n "${2}" ]; then
		expectedName=~/.${2}
	fi
	if [ -a ${expectedName} ]; then
		mv ${expectedName} ${expectedName}.bak
	fi
	ln -sf $PWD/${1} ${expectedName}
}

mkdir -p ~/.config

# link config files
safeCopyConfig vimrc
safeCopyConfig bashrc
safeCopyConfig zshrc
safeCopyConfig p10k.zsh
safeCopyConfig aliasrc
safeCopyConfig gitconfig
safeCopyConfig nvim config/nvim

# base16 install
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# favorites: tomorrow-night

# Powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git ~/.config/powerlevel10k

# vim plugin manager
mkdir -p ~/.vim/autoload
wget -O ~/.vim/autoload/plug.vim \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
\vim +PlugInstall +qall
