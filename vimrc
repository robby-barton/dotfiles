execute pathogen#infect()
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'IrishPrime/whitewash.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
call vundle#end()
set laststatus=2
set noshowmode
set nu
set autoindent noexpandtab tabstop=4 shiftwidth=4
set ttimeoutlen=50
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

if has("autocmd")
	filetype plugin indent on

	if exists("+omnifunc")
		autocmd Filetype *
					\if &omnifunc == "" |
					\ setlocal omnifunc=syntaxcomplete#Complete |
					\endif
	endif

	augroup python_files
		autocmd!
		autocmd FileType python setlocal noexpandtab
		autocmd FileType python set tabstop=4
		autocmd FileType python set shiftwidth=4
	augroup END

	augroup web_files
		autocmd!
		autocmd FileType json,javascript setlocal expandtab
		autocmd FileType json,javascript set tabstop=2
		autocmd FileType json,javascript set shiftwidth=2
	augroup END

	augroup vimrcEx
		autocmd!
		autocmd FileType vim setlocal textwidth=78
		autocmd BufWritePost .vimrc nested :source $MYVIMRC
		autocmd BufReadPost *
					\if line("'\"") > 1 && line("'\"") <= line("$") |
					\ exe "normal! g`\"" |
					\endif
	augroup END

endif

if has("cscope")
	set cscopetag cscopeverbose
	set csto=0

	if has("quickfix")
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif

	cnoreabbrev <expr> csa
				\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs add"  : "csa")
	cnoreabbrev <expr> csf
				\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs find" : "csf")
	cnoreabbrev <expr> csk
				\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs kill" : "csk")
	cnoreabbrev <expr> csr
				\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs reset" : "csr")
	cnoreabbrev <expr> css
				\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs show" : "css")
	cnoreabbrev <expr> csh
				\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs help" : "csh")

	"command -nargs=0 CScope cs add $VIMSRC/src/cscope.out $VIMSRC/src

	" Automatically load CScope
	function! LoadCscope()
		let db = findfile("cscope.out", ".;")
		if (!empty(db))
			let path = strpart(db, 0, match(db, "/cscope.out$"))
			set nocscopeverbose " suppress 'duplicate connection' error
			exe "cs add " . db . " " . path
			set cscopeverbose
		endif
	endfunction
	au BufEnter /* call LoadCscope()
endif

" Mapping to edit vimrc
nmap <Leader>v :tabedit $MYVIMRC<CR>

" Mappings to make the global register less annoying
map <Leader>p :set paste<CR>"+]p:set nopaste<CR>
map <Leader>P :set paste<CR>"+]P:set nopaste<CR>
map <Leader>y "+y
map <Leader>Y "+Y

set tags=./tags,tags;$HOME/src/sandboxes/bp-git

" Airline options
let g:airline_powerline_fonts = 1
let g:airline_theme = "solarized"
let g:airline#extensions#syntastic#enabled = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Syntastic options
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '»'
