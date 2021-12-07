local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	cmd 'packadd packer.nvim'
end

-- vim settings
require 'settings'

-- custom keymaps
require 'maps'

-- install packer plugins
require 'install_plugins'

-- load plugins
require 'plugins'

-- set colorscheme
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
