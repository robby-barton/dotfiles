#! /usr/bin/env bash
PWD=`pwd`

mkdir -p ~/.config

# link config files
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/bashrc ~/.bashrc
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/p10k.zsh ~/.p10k.zsh
ln -sf $PWD/aliasrc ~/.aliasrc
ln -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/nvim ~/.config/nvim

# base16 install
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# favorites: tomorrow-night

# Powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git ~/.config/powerlevel10k

# vim plugin manager
mkdir -p ~/.vim/autoload
wget -O ~/.vim/autoload/plug.vim \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# neovim setup
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
