local plugins = {}
local editor = require('modules.editor')
local lsp = require('modules.lsp')
local themes = require('modules.themes')
local tools = require('modules.tools')
local completion = require('modules.completion')
plugins['stevearc/aerial.nvim'] = {
	opt = true,
	config = editor.aerial
}
plugins['windwp/nvim-autopairs'] = {
	after = 'nvim-cmp',
	config = editor.autopairs
}
plugins['Pocco81/AutoSave.nvim'] = {
	config = editor.autosave
}
plugins['rmagatti/auto-session'] = {
	config = editor.autosession
}
plugins['famiu/bufdelete.nvim'] = { }
plugins['lukas-reineke/indent-blankline.nvim'] = {
	opt =true,
	config = editor.blankline
}
plugins['max397574/better-escape.nvim'] = {
	event = 'InsertEnter',
	config = editor.better_escape
}
plugins['akinsho/bufferline.nvim'] = {
	config = editor.bufferline
}
plugins['norcalli/nvim-colorizer.lua']= {
	config = function() require('colorizer').setup({}) end
}
plugins['sindrets/diffview.nvim'] = {
	opt = true,
	config = editor.diffview
}
plugins['lewis6991/gitsigns.nvim'] = {
	opt = true,
	config = editor.gitsigns
}
plugins['nvim-lua/plenary.nvim'] = { opt = true }
plugins['terrortylor/nvim-comment'] = {
	config = editor.comment
}
plugins["kyazdani42/nvim-tree.lua"] = {
	opt = true,
	config = function()
		require('nvim-tree').setup()
	end
}
plugins['kyazdani42/nvim-web-devicons'] = {}
plugins['edluffy/specs.nvim'] = {
	config = editor.specs
}
plugins["nvim-treesitter/nvim-treesitter"] = {
	opt = true,
	run = ':TSUpdate',
	config = editor.treesitter
}
plugins["nvim-treesitter/nvim-treesitter-refactor"] = {
	after = 'nvim-treesitter'
}
plugins['nvim-treesitter/nvim-treesitter-textobjects'] = {
	after = 'nvim-treesitter'
}
plugins['windwp/nvim-ts-autotag'] = {
	after = 'nvim-treesitter'
}
plugins['p00f/nvim-ts-rainbow'] = {
	after = 'nvim-treesitter'
}
plugins['andymass/vim-matchup'] = {after = 'nvim-treesitter'}
plugins['romgrk/nvim-treesitter-context'] = {
	after = 'nvim-treesitter',
	config = editor.ts_context
}
plugins['abecodes/tabout.nvim'] = {
	after = 'nvim-treesitter',
	config = editor.tabout
}
plugins['folke/twilight.nvim'] = {
	config = editor.twilight
}
plugins['gelguy/wilder.nvim'] = {
	 requires = {'roxma/nvim-yarp',
		 'roxma/vim-hug-neovim-rpc',
		 'romgrk/fzy-lua-native'},
	 config = editor.wilder
 }

plugins['lewis6991/impatient.nvim'] = {
	config = function()
		require'impatient'.enable_profile()
	end
	}
plugins['iamcco/markdown-preview.nvim'] = {run = 'cd app && yarn install'}
plugins["rcarriga/nvim-notify"] = {
	config = tools.notify
}
plugins["nvim-telescope/telescope.nvim"] = {
	opt = true,
	after = 'plenary.nvim',
	 requires = {
		    {"sharkdp/fd"},
		    {"BurntSushi/ripgrep"},
	    	    {'jvgrootveld/telescope-zoxide'},
	    },
	config = tools.telescope
}
plugins['nvim-telescope/telescope-frecency.nvim'] = {
	requires = 'tami5/sqlite.lua'
}
plugins["akinsho/toggleterm.nvim"] = {
	config = tools.toggleterm
}

plugins["neovim/nvim-lspconfig"] = {opt = true }
plugins['ray-x/lsp_signature.nvim'] = { opt = true }
plugins["williamboman/nvim-lsp-installer"] = {
	config = lsp.lsp_installer
}

plugins["goolord/alpha-nvim"] = {
	config = themes.alpha
}
plugins["catppuccin/nvim"] = {
	as = 'catppuccin',
	config = themes.catppuccin
}
plugins["projekt0n/circles.nvim"] = {
	after = 'nvim-tree.lua',
	config = themes.circles
}
plugins['SmiteshP/nvim-gps'] = {
	after = 'lualine.nvim',
	config = themes.gps
}
plugins["nvim-lualine/lualine.nvim"] = {
	after = 'nvim-treesitter',
	config = themes.lualine
}
plugins['arkav/lualine-lsp-progress'] = {
	after = 'lualine.nvim'
}
plugins['EdenEast/nightfox.nvim'] = {
	config = themes.nightfox
}
plugins['shaunsingh/nord.nvim'] = {
	config = themes.nord
}
plugins['folke/tokyonight.nvim'] = {
	config = themes.tokyonight
}
plugins['xiyaowong/nvim-transparent'] = {
	config = themes.transparent
}
plugins['hrsh7th/nvim-cmp'] = {
	requires = {
		{'zbirenbaum/copilot.lua',after = 'nvim-cmp', opt = true},
		{'zbirenbaum/copilot-cmp',after = {'nvim-cmp','copilot.lua'}, opt = true},
		{'hrsh7th/cmp-buffer',after = 'nvim-cmp',opt = true},
		{'saadparwaiz1/cmp_luasnip',after = {'LuaSnip','nvim-cmp'}, opt = true},
		{'hrsh7th/cmp-emoji',after = 'nvim-cmp', opt = true},
		{'hrsh7th/cmp-nvim-lsp',after = 'nvim-cmp',opt  = true},
		{'hrsh7th/cmp-nvim-lua',after ='nvim-cmp',opt = true},
		{'hrsh7th/cmp-path',after = 'nvim-cmp',opt = true},
		{'f3fora/cmp-spell',after = 'nvim-cmp',opt = true},
		{'onsails/lspkind-nvim',after = 'nvim-cmp', opt = true}},
	after = 'LuaSnip',
	config = completion.cmp
}
plugins['L3MON4D3/LuaSnip'] = {
	event = 'InsertEnter',
	config = completion.snippets,
}
plugins['rafamadriz/friendly-snippets'] = {
	event = 'InsertEnter',
	after = 'LuaSnip',
}
plugins['michaelb/sniprun'] = {run = 'bash ./install.sh &'}
plugins['folke/trouble.nvim'] = { opt = true }
plugins['rhysd/accelerated-jk'] = {}
plugins['github/copilot.vim'] = {}
plugins['mbbill/undotree'] = { event = 'TextChanged' }
plugins['itchyny/vim-cursorword'] = {}
plugins['dstein64/vim-startuptime'] = {}
plugins['vimwiki/vimwiki'] = {
	opt = true,
	ft = 'markdown'
}
return plugins
