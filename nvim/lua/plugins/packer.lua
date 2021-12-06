local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require 'packer'

return packer.startup(function(use)
	-- manage itself
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'RRethy/nvim-base16'

	-- status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- better syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
	}

	-- autopair
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end
	}

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	-- autocomplete
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'saadparwaiz1/cmp_luasnip',
		}
	}

	-- markdown previews
	use {
		'iamcco/markdown-preview.nvim',
		run = function () vim.fn['mkdp#util#install']() end,
		ft = {'markdown'}
	}

	-- Git things
	use {
		'lewis6991/gitsigns.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}

	-- searching
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
