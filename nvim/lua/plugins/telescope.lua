local map = vim.api.nvim_set_keymap

local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup{
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close -- ESC closes
			}
		},
		show_line = false,
		prompt_prefix = '> ',
		prompt_title = '',
		results_title = '',
		preview_title = '',
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		sorting_strategy = 'ascending',
		scroll_strategy = 'cycle',
		layout_strategy = 'vertical',
		layout_config = {
			preview_cutoff = 1,
			prompt_position = 'top',
			horizontal = {
				preview_width = 0.6
			},
			width = 0.8,
			height = 0.9
		}
	},
}

telescope.load_extension 'fzf'

-- Telescope keymaps
local default_opts = { noremap = true, silent = true }
map('n', '<leader>gf', ':lua require\'telescope.builtin\'.git_files{}<CR>', default_opts)
map('n', '<leader>ff', ':lua require\'telescope.builtin\'.find_files{}<CR>', default_opts)
map('n', '<leader>bf', ':lua require\'telescope.builtin\'.buffers{}<CR>', default_opts)
