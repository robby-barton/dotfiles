local cmd = vim.cmd
local gitsigns = require 'gitsigns'

gitsigns.setup {
	signcolumn = false,
	numhl = true,
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 100
	}
}
