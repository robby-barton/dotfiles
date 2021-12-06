require('nvim-treesitter.configs').setup {
	ensure_installed = { "python", "ruby", "go", "bash", "javascript", "lua" },
	sync_install = false,
	highlight = {
		enable = true
	}
}
