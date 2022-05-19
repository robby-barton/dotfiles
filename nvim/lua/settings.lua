local cmd = vim.cmd
local g = vim.g
local o = vim.o
local opt = vim.opt

-- General
g.mapleader = '\\'
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.guicursor = 'i:block'

-- Display
o.cursorline = true
o.laststatus = 2
o.list = true
opt.listchars = { eol = '¬', tab = '→ ' }
o.nu = true
o.showcmd = true
o.showmatch = true
o.showmode = false
o.termguicolors = true

-- Whitespace
o.autoindent = true
o.expandtab = false
o.fixendofline = false
o.shiftwidth = 4
o.tabstop = 4

-- Search
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.smartcase = true

-- Remember place in buffer
cmd [[ au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

-- Filetype specific formatting
cmd [[
	au FileType python setlocal noexpandtab shiftwidth=4 tabstop=4
	au FileType json,javascript setlocal expandtab shiftwidth=2 tabstop=2
	au FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2
]]
