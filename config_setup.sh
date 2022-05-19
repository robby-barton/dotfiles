#!/bin/bash
PWD=`pwd`

# Link rc files
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/bashrc ~/.bashrc
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/aliasrc ~/.aliasrc

# Base16 install
mkdir -p ~/.config
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
base16_tomorrow-night
# favorites: tomorrow-night

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

# Neovim settup
mkdir -p ~/.config
ln -sf $PWD/nvim ~/.config/nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

if [ "$(uname -s)" = "Linux" ]; then
	mkdir -p ~/.fonts/
	(cd ~/.fonts && curl -fLo "DejaVu Sans Mono Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf)
	fc-cache -vf ~/.fonts/
fi
