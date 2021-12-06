local telescope = require 'telescope'

telescope.setup{
	defaults = {
		width = 0.8,
		show_line = false,
		prompt_prefix = 'TS Symbols>',
		prompt_title = '',
		results_title = '',
		preview_title = '',
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
	}
}
