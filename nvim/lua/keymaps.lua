local map = vim.api.nvim_set_keymap

map('n', '<CR>', ':nohlsearch<CR>', {})
map('n', '<leader>*', ":let @/='<C-R>=expand(\"<cword>\")<CR>'<CR>:set hls<CR>", { noremap = true, silent = true })


map('n', '<leader>l', ':ls <CR>', { noremap = true, silent = true })
map('n', '<leader>d', ':bd <CR>', { noremap = true, silent = true })

-- Telescope keymaps
map('n', '<leader>gf', ':lua require\'telescope.builtin\'.git_files{}<CR>', { noremap = true, silent = true })
map('n', '<leader>ff', ':lua require\'telescope.builtin\'.find_files{}<CR>', { noremap = true, silent = true })
