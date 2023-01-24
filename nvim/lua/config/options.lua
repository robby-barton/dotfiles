-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local cmd = vim.cmd
local opt = vim.opt

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.guicursor = "i:block"

-- Display
opt.cursorline = true
opt.laststatus = 2
opt.list = true
opt.listchars = { eol = "¬", tab = "→ " }
opt.nu = true
opt.showcmd = true
opt.showmatch = true
opt.showmode = false
opt.termguicolors = true
opt.cc = "80,100"

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

-- Undo some LazyVim default settings
opt.signcolumn = "no"
opt.relativenumber = false
opt.wrap = true

-- Remember place in buffer
cmd([[ au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

-- Filetype specific formatting
cmd([[
	au FileType python setlocal noexpandtab shiftwidth=4 tabstop=4
	au FileType json,javascript setlocal expandtab shiftwidth=2 tabstop=2
	au FileType ruby,eruby setlocal expandtab shiftwidth=2 tabstop=2
]])

cmd([[
	au ColorScheme * hi Comment gui=italic cterm=italic
	au ColorScheme * hi CursorLine guibg=none ctermbg=none
	au ColorScheme * hi CursorLineNr gui=none cterm=none guibg=none ctermbg=none
	au ColorScheme * hi NonText guibg=none ctermbg=none
	au ColorScheme * hi Normal guibg=none ctermbg=none

	au ColorScheme * hi! link LineNr Comment

	au ColorScheme * hi GitGutterAdd guibg=none
	au ColorScheme * hi GitGutterChange guibg=none
	au ColorScheme * hi GitGutterDelete guibg=none
]])
