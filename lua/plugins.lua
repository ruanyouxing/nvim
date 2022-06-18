local plugins = {}
local editor = require('editor')
local lsp = require('lsp')
local themes = require('themes')
local tools = require('tools')
local completion = require('completion')
plugins['stevearc/aerial.nvim'] = {
	config = editor.aerial()
}
plugins['windwp/nvim-autopairs'] = {
	config = editor.autopairs()
}
plugins['Pocco81/AutoSave.nvim'] = {
	config = editor.autosave()
}
plugins['rmagatti/auto-session'] = {
	config = editor.autosession()
}
plugins['famiu/bufdelete.nvim'] = {opt = false }
plugins['lukas-reineke/indent-blankline.nvim'] = {
	config = editor.blankline()
}
plugins['max397574/better-escape.nvim'] = {
	event = 'InsertEnter',
	config = editor.better_escape()
}
plugins['akinsho/bufferline.nvim'] = {
	config = editor.bufferline()
}
plugins['norcalli/nvim-colorizer.lua']= {
	opt = true,
	config = editor.colorizer()
}
plugins['sindrets/diffview.nvim'] = {
	config = editor.diffview()
}
plugins['lewis6991/gitsigns.nvim'] = {
	requires = 'nvim-lua/plenary.nvim',
	config = editor.gitsigns()
}
plugins['terrortylor/nvim-comment'] = {
	config = editor.comment()
}
plugins["kyazdani42/nvim-tree.lua"] = {
	requires = {"kyazdani42/nvim-web-devicons"},
	config = editor.nvim_tree()
}
plugins['edluffy/specs.nvim'] = {
	config = editor.specs()
}
plugins["nvim-treesitter/nvim-treesitter"] = {
	run = ':TSUpdate',
	config = editor.treesitter()
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
	config = editor.ts_context()
}
plugins['abecodes/tabout.nvim'] = {
	config = editor.tabout()
}
plugins['folke/twilight.nvim'] = {
	config = editor.twilight()
}
plugins['gelguy/wilder.nvim'] = {
	 requires = {'roxma/nvim-yarp',
		 'roxma/vim-hug-neovim-rpc',
		 'romgrk/fzy-lua-native'},
	 config = editor.wilder()
 }

plugins['lewis6991/impatient.nvim'] = {
	 	config = function()
			require'impatient'.enable_profile()
		end}
plugins['iamcco/markdown-preview.nvim'] = {run = 'cd app && yarn install'}
plugins["rcarriga/nvim-notify"] = {
	opt = false,
	config = tools.notify()}
plugins["nvim-telescope/telescope.nvim"] = {
	 requires = {{"sharkdp/fd"},
		    {"BurntSushi/ripgrep"},
	    	    {'jvgrootveld/telescope-zoxide'}
	    },
	config = tools.telescope()}
plugins["akinsho/toggleterm.nvim"] = {
	opt = 'BufEnter',
	config = tools.toggleterm()}


plugins["neovim/nvim-lspconfig"] = {opt = false }
plugins["williamboman/nvim-lsp-installer"] = {
	opt = false,
	config = lsp.lsp_installer()
}



plugins["goolord/alpha-nvim"] = {
	config = themes.alpha()
}
plugins["catppuccin/nvim"] = {
	as = 'catppuccin',
	config = themes.catppuccin()
}
plugins["projekt0n/circles.nvim"] = {
	config = themes.circles()
}
plugins['SmiteshP/nvim-gps'] = {
	config = themes.gps()
}
plugins["nvim-lualine/lualine.nvim"] = {
	requires = {'arkav/lualine-lsp-progress'},
	config = themes.lualine()
}
plugins['EdenEast/nightfox.nvim'] = {
	config = themes.nightfox()
}
plugins['shaunsingh/nord.nvim'] = {
	config = themes.nord()
}
plugins['folke/tokyonight.nvim'] = {
	config = themes.tokyonight()
}
plugins['xiyaowong/nvim-transparent'] = {
	config = themes.transparent()
}
plugins['hrsh7th/nvim-cmp'] = {
	requires = {
		{'zbirenbaum/copilot.lua',after = 'nvim-cmp',event = 'VimEnter'},
		{'zbirenbaum/copilot-cmp',after = {'nvim-cmp','copilot.lua'}},
		{'hrsh7th/cmp-buffer',after = 'nvim-cmp'},
		{'saadparwaiz1/cmp_luasnip',after = 'LuaSnip'},
		{'hrsh7th/cmp-nvim-lsp',after = 'cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lua',after ='cmp-nvim-lsp'},
		{'hrsh7th/cmp-path',after = 'nvim-cmp'},
		{'f3fora/cmp-spell',after = 'nvim-cmp'},
		{'rafamadriz/friendly-snippets',after = 'nvim-cmp'}},
	config = completion.cmp()
}
plugins['L3MON4D3/LuaSnip'] = {opt = false }
plugins['michaelb/sniprun'] = {run = 'bash ./install.sh &'}
plugins['RishabhRD/nvim-lsputils'] =  {requires = 'RishabhRD/popfix'}
plugins['ray-x/lsp_signature.nvim'] = {opt = false }
plugins['folke/trouble.nvim'] = {opt = false }
plugins['rhysd/accelerated-jk'] = {opt = false }
plugins['github/copilot.vim'] = {opt = false }
plugins['onsails/lspkind-nvim'] = {opt = false }
plugins['mbbill/undotree'] = {opt = false }
plugins['itchyny/vim-cursorword'] = {opt = false }
plugins['dstein64/vim-startuptime'] = {opt = false }
plugins['vimwiki/vimwiki'] = {opt = false }
return plugins
