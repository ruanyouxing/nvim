
local editor = {
	 'windwp/nvim-autopairs',
	 'rmagatti/auto-session',
	 {'gelguy/wilder.nvim',
		 requires = {'roxma/nvim-yarp',
			 'roxma/vim-hug-neovim-rpc',
			 'romgrk/fzy-lua-native'}},
	 {'norcalli/nvim-colorizer.lua',opt = true},
	 {'jdhao/better-escape.vim',event = 'InsertEnter',config = function()
		vim.g.better_escape_shortcut = "jk"
		vim.g.escape_interval = "100"
	 end},
	 'itchyny/vim-cursorword',
	 'lukas-reineke/indent-blankline.nvim',
	 {'stevearc/aerial.nvim',after = 'nvim-lspconfig'},
	 'akinsho/bufferline.nvim',
	 {'dstein64/nvim-scrollview',event = 'BufRead'},
	 {'folke/zen-mode.nvim', requires = 'folke/twilight.nvim',},
	 {'lewis6991/gitsigns.nvim',requires = 'nvim-lua/plenary.nvim'},
	 {"nvim-treesitter/nvim-treesitter",run = ':TSUpdateSync',requires = {
		 {"nvim-treesitter/nvim-treesitter-refactor",after = 'nvim-treesitter'},
	         {'windwp/nvim-ts-autotag',after = 'nvim-treesitter'},
	         {'p00f/nvim-ts-rainbow',after = 'nvim-treesitter'},
	 	 {'andymass/vim-matchup',after = 'nvim-treesitter'},
		 {'romgrk/nvim-treesitter-context'},
	 }},
	 'Pocco81/AutoSave.nvim',
	 'edluffy/specs.nvim',
	 'abecodes/tabout.nvim',
	 'terrortylor/nvim-comment',
}
return editor
