filetype off

set autoindent
set cursorline
set laststatus=2
set listchars=tab:→\ ,eol:¬
set nofixendofline
set noshowmode
set nu
set showcmd
set showmatch
set t_Co=256
set tabstop=4 shiftwidth=4 noexpandtab
set ttimeoutlen=50
syntax enable

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase
nmap <CR> :nohlsearch<CR>
nnoremap <silent> <Leader>* :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'APZelos/blamer.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
call plug#end()

" Color Scheme
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif
highlight Comment cterm=italic
highlight CursorLine ctermbg=none
highlight CursorLineNr cterm=none ctermbg=none ctermfg=7
highlight LineNr cterm=italic ctermbg=none
highlight NonText ctermbg=none
highlight Normal ctermbg=none

" Mouse
if has("mouse")
	set mouse=a
endif

" Auto Commands
if has("autocmd")
	" Remember place in buffer
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

	" Allow <CR> to goto line from quickfix list and close list
	au BufReadPost quickfix nnoremap <buffer> <CR> <CR> :ccl <CR>

	filetype plugin indent on

	if exists("+omnifunc")
		autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
	endif

	augroup python_files
		autocmd!
		autocmd FileType python setlocal noexpandtab shiftwidth=4 tabstop=4
	augroup END

	augroup web_files
		autocmd!
		autocmd FileType json,javascript setlocal expandtab shiftwidth=2 tabstop=2
	augroup END

	augroup vimrcEx
		autocmd!
		autocmd BufWritePost .vimrc nested :source $MYVIMRC
	augroup END

	augroup ruby_files
		autocmd!
		autocmd FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2 list
	augroup END

endif

" Mapping to edit vimrc
nmap <Leader>v :tabedit $MYVIMRC<CR>

" Mappings to make the global register less annoying
if has('clipboard')
	map <Leader>p :set paste<CR>"+]p<Esc>:set nopaste<CR>
	map <Leader>P :set paste<CR>"+]P<Esc>:set nopaste<CR>
	map <Leader>y "+y
	map <Leader>Y "+Y
endif

" Mappings for fzf.vim
nnoremap <Leader>gf :GFiles<CR>

" Airline options
let g:airline_powerline_fonts = 1
let g:solarized_termcolors=256
let g:airline_theme = "solarized"
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#ale#enabled = 1

" Ale Settings
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_use_global_executables = 1
let g:ale_set_highlights = 0

" CoC Settings
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:coc_global_extensions = ['coc-solargraph']

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Quickfix list mappings for open/close
nnoremap <silent> <Leader>o :copen <CR>
nnoremap <silent> <Leader>c :ccl <CR>

" Buffer mappings
nnoremap <silent> <Leader>l :ls <CR>

nnoremap <Leader>d :bd <CR>

" Blamer
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_delay = 500
let g:blamer_date_format = '%Y-%m-%d %H:%M:%S'
let g:blamer_prefix = ' --'
let g:blamer_template = '[<commit-short>] <author> (<author-time>) ─ <summary>'