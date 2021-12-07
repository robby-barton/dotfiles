local map = vim.api.nvim_set_keymap
local maps = {}
local mapfn = function(fn)
	return [[<cmd>lua require'maps'.]] .. fn .. [[()<CR>]]
end

local default_opts = { noremap = true, silent = true }
map('n', '<CR>', ':nohlsearch<CR>', {})
map('n', '<leader>*', ":let @/='<C-R>=expand(\"<cword>\")<CR>'<CR>:set hls<CR>", default_opts)


map('n', '<leader>l', ':ls <CR>', default_opts)
map('n', '<leader>d', ':bd <CR>', default_opts)

maps.source_config = function()
	local ft = vim.api.nvim_buf_get_option(0, 'filetype')
	if ft == 'lua' or ft == 'vim' then
		vim.cmd 'source %'
	end
end
map('n', '<leader>l', mapfn 'source_config', {})

maps.close_all_floating = function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local win_config = vim.api.nvim_win_get_config(win)
		if win_config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end
map('n', '<esc>', mapfn 'close_all_floating', { silent = true })

return maps
