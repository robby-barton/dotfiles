local cmd = vim.cmd
local opt = vim.opt

opt.termguicolors = true
cmd [[
	let base16colorspace=246
	colorscheme base16-tomorrow-night

	hi Comment gui=italic cterm=italic
	hi CursorLine guibg=none ctermbg=none
	hi CursorLineNr gui=none cterm=none guibg=none ctermbg=none
	hi NonText guibg=none ctermbg=none
	hi Normal guibg=none ctermbg=none

	hi! link LineNr Comment
]]
