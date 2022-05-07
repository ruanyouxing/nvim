local editor = require('editor')
local lspconf = require('lsp')
local tools = require('tools')
local themes = require('themes')
local completion = require('completion')

local plugins = {
	 {'stevearc/aerial.nvim',opt = true,config = editor.aerial()},
	 {'windwp/nvim-autopairs',config = editor.autopairs()},
	 {'Pocco81/AutoSave.nvim',config = editor.autosave()},
	 {'rmagatti/auto-session',config = editor.autosession()},
	 {'lukas-reineke/indent-blankline.nvim', config = editor.blankline()},
	 {'max397574/better-escape.nvim',opt = false,event = 'InsertEnter',config = editor.better_escape(),
		requires = {"rhysd/accelerated-jk"}},
	 {'akinsho/bufferline.nvim', config = editor.bufferline()},
	 {'norcalli/nvim-colorizer.lua',opt = true, config = editor.colorizer()},
	 {'terrortylor/nvim-comment', config = editor.comments()},
	 {'lewis6991/gitsigns.nvim',requires = 'nvim-lua/plenary.nvim', config = editor.gitsigns()},
	 {"kyazdani42/nvim-tree.lua",config = editor.nvimtree(),
	 	 requires = {"kyazdani42/nvim-web-devicons"}},
	 {'edluffy/specs.nvim', config = editor.specs()},
	 {"nvim-treesitter/nvim-treesitter",run = ':TSUpdateSync', config = editor.treesitter(),
	 requires = {
		 {"nvim-treesitter/nvim-treesitter-refactor",after = 'nvim-treesitter'},
	         {'windwp/nvim-ts-autotag',after = 'nvim-treesitter'},
	         {'p00f/nvim-ts-rainbow',after = 'nvim-treesitter'},
		 {'andymass/vim-matchup',after = 'nvim-treesitter'}}},
	 {'romgrk/nvim-treesitter-context', config = editor.ts_context()},
	 {'abecodes/tabout.nvim', config = editor.tabout()},
	 {'folke/twilight.nvim',config = editor.twilight()},
	 {'gelguy/wilder.nvim', config = editor.wilder(),
		 requires = {'roxma/nvim-yarp',
			 'roxma/vim-hug-neovim-rpc',
			 'romgrk/fzy-lua-native'}},
	 {'folke/zen-mode.nvim',config = editor.zenmode()},


	 {"glepnir/dashboard-nvim", config = tools.dashboard()},
	 {'lewis6991/impatient.nvim', config = function() require'impatient'.enable_profile() end},
	 {'iamcco/markdown-preview.nvim',run = 'cd app && yarn install'},
	 {"rcarriga/nvim-notify", config = tools.notify()},
	 {"nvim-telescope/telescope.nvim", config = tools.telescope(),
	 requires = {{"sharkdp/fd"},
		    {"BurntSushi/ripgrep"}}},
	 {"akinsho/toggleterm.nvim",config = tools.toggleterm()},
	 {'xiyaowong/nvim-transparent', config = tools.transparent()},


	{"neovim/nvim-lspconfig"},
	{"williamboman/nvim-lsp-installer",config = lspconf.lsp_install()},



	{"catppuccin/nvim",as = "catppuccin",config = themes.catppuccin()},
	{"projekt0n/circles.nvim",config = themes.circles()},
	{'Mofiqul/dracula.nvim',as = 'dracula'},
	{"nvim-lualine/lualine.nvim", config = themes.lualine(),
	requires = {'arkav/lualine-lsp-progress',
		   {'SmiteshP/nvim-gps',config = themes.nvim_gps()}}},
	{'shaunsingh/nord.nvim', config = themes.nord()},
	{"rose-pine/neovim",as = 'rose-pine', config = themes.rose_pine()},
	{"folke/tokyonight.nvim", config = themes.tokyonight()},
	{'Mofiqul/vscode.nvim', config = themes.vscodetheme()},


	{'hrsh7th/nvim-cmp', config = completion.cmp(),
	requires = {
		{'saadparwaiz1/cmp_luasnip',after = 'LuaSnip'},
		{'hrsh7th/cmp-nvim-lsp',after = 'cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lua',after ='cmp-nvim-lsp'},
		{'hrsh7th/cmp-buffer',after = 'nvim-cmp'},
		{'f3fora/cmp-spell',after = 'nvim-cmp'},
		{'hrsh7th/cmp-path',after = 'nvim-cmp'},
		{'L3MON4D3/LuaSnip', config = completion.snippet()},
		{'rafamadriz/friendly-snippets',after = 'nvim-cmp'}}},
	{'RishabhRD/nvim-lsputils', requires = 'RishabhRD/popfix', config = completion.lsputils()},
	{'ray-x/lsp_signature.nvim', config = completion.signature()},
	{'folke/trouble.nvim', config = completion.trouble()},


	 'github/copilot.vim',
	 'onsails/lspkind-nvim',
	 {'dstein64/nvim-scrollview',event = 'BufRead'},
	 'mbbill/undotree',
	 'itchyny/vim-cursorword',
	 'dstein64/vim-startuptime',
	 'vimwiki/vimwiki',
}


return plugins
