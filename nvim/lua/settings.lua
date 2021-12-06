local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

-- General
g.mapleader = ','
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.guicursor = 'i:block'

-- Display
opt.cursorline = true
opt.laststatus = 2
opt.list = true
opt.listchars = { eol = '¬', tab = '→ ' }
opt.nu = true
opt.showcmd = true
opt.showmatch = true
opt.showmode = false

-- Whitespace
opt.autoindent = true
opt.expandtab = false
opt.fixendofline = false
opt.shiftwidth = 4
opt.tabstop = 4

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true

-- Remember place in buffer
cmd [[ au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

-- Filetype specific formatting
cmd [[
	au FileType python setlocal noexpandtab shiftwidth=4 tabstop=4
	au FileType json,javascript setlocal expandtab shoftwidth=2 tabstop=2
	au FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2
]]
