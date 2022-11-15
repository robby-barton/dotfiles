#! /usr/bin/env bash
PWD=`pwd`

mkdir -p ~/.config

# link config files
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/bashrc ~/.bashrc
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/aliasrc ~/.aliasrc
ls -sf $PWD/gitconfig ~/.gitconfig
ln -sf $PWD/nvim ~/.config/nvim

# base16 install
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
base16_tomorrow-night
# favorites: tomorrow-night

# vim plugin manager
mkdir -p ~/.vim/autoload
wget -O ~/.vim/autoload/plug.vim \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# neovim setup
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
