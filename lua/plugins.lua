local plugins = {}
local editor = require('modules.editor')
local ui = require('modules.ui')
local tools = require('modules.tools')
local completion = require('modules.completion')
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
plugins['famiu/bufdelete.nvim'] = {
	opt = true,
	event = 'BufDelete',
	config = {
		vim.keymap.set('n', '<C-w>', function() require 'bufdelete'.bufdelete(0, true) end)
	}
}
plugins['max397574/better-escape.nvim'] = {
	event = 'InsertEnter',
	config = editor.better_escape
}
plugins['norcalli/nvim-colorizer.lua'] = {
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
plugins['kyazdani42/nvim-web-devicons'] = {}
plugins['kevinhwang91/nvim-ufo'] = {
	requires = 'kevinhwang91/promise-async',
	after = { 'nvim-treesitter','nvim-lspconfig' },
	config = editor.ufo,
}
plugins['edluffy/specs.nvim'] = {
	config = editor.specs
}
plugins["nvim-treesitter/nvim-treesitter"] = {
	event = 'BufRead',
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
plugins['andymass/vim-matchup'] = { after = 'nvim-treesitter' }
plugins['romgrk/nvim-treesitter-context'] = {
	after = 'nvim-treesitter',
	config = editor.ts_context
}
plugins['simrat39/symbols-outline.nvim'] = {
	after = 'nvim-lspconfig',
	config = editor.symbols_outline,
}
plugins['abecodes/tabout.nvim'] = {
	after = 'nvim-treesitter',
	config = editor.tabout
}
plugins['lewis6991/impatient.nvim'] = {
	config = function()
		require 'impatient'.enable_profile()
	end
}
plugins['iamcco/markdown-preview.nvim'] = {
	run = 'cd app && yarn install',
	setup = function()
		vim.g.mkdp_filetypes = { 'markdown' }
	end,
	ft = { 'markdown' },
}
plugins["rcarriga/nvim-notify"] = {
	config = ui.notify
}
plugins["nvim-telescope/telescope.nvim"] = {
	opt = true,
	after = 'plenary.nvim',
	requires = {
		{ "sharkdp/fd" },
		{ "BurntSushi/ripgrep" },
		{ 'jvgrootveld/telescope-zoxide' },
	},
	config = tools.telescope
}
plugins["akinsho/toggleterm.nvim"] = {
	config = tools.toggleterm
}


plugins["goolord/alpha-nvim"] = {
	config = ui.alpha
}
plugins['lukas-reineke/indent-blankline.nvim'] = {
	after = 'nvim-treesitter',
	config = ui.blankline
}
plugins['akinsho/bufferline.nvim'] = {
	opt = true,
	event = 'UIEnter',
	config = ui.bufferline
}
plugins["catppuccin/nvim"] = {
	as = 'catppuccin',
	config = ui.catppuccin
}
plugins["projekt0n/circles.nvim"] = {
	after = 'nvim-tree.lua',
	config = ui.circles
}
plugins['SmiteshP/nvim-gps'] = {
	after = 'lualine.nvim',
	config = ui.gps
}
plugins["nvim-lualine/lualine.nvim"] = {
	after = 'nvim-treesitter',
	config = ui.lualine
}
plugins['arkav/lualine-lsp-progress'] = {
	after = 'lualine.nvim'
}
plugins['EdenEast/nightfox.nvim'] = {
	config = ui.nightfox
}
plugins['shaunsingh/nord.nvim'] = {
	config = ui.nord
}
plugins["kyazdani42/nvim-tree.lua"] = {
	opt = true,
	config = function()
		require('nvim-tree').setup()
	end
}
plugins['folke/tokyonight.nvim'] = {
	config = ui.tokyonight
}
plugins['xiyaowong/nvim-transparent'] = {
	config = ui.transparent
}
plugins['folke/twilight.nvim'] = {
	event = 'CursorMoved',
	config = ui.twilight
}
plugins['gelguy/wilder.nvim'] = {
	opt = true,
	event = { 'CmdwinEnter', 'CmdlineEnter' },
	requires = { { 'roxma/nvim-yarp', run = ':UpdateRemotePlugins' },
		'roxma/vim-hug-neovim-rpc',
		'romgrk/fzy-lua-native' },
	config = ui.wilder
}
plugins['hrsh7th/nvim-cmp'] = {
	requires = {
		{ 'zbirenbaum/copilot.lua', after = { 'nvim-cmp', 'copilot.vim' }, opt = true },
		{ 'zbirenbaum/copilot-cmp', after = { 'nvim-cmp', 'copilot.lua' }, opt = true },
		{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp', opt = true },
		{ 'saadparwaiz1/cmp_luasnip', after = { 'LuaSnip', 'nvim-cmp' }, opt = true },
		{ 'hrsh7th/cmp-emoji', after = 'nvim-cmp', opt = true },
		{ 'hrsh7th/cmp-nvim-lsp', event = 'BufRead', opt = true },
		{ 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', opt = true },
		{ 'hrsh7th/cmp-path', after = 'nvim-cmp', opt = true },
		{ 'f3fora/cmp-spell', after = 'nvim-cmp', opt = true },
		{ 'onsails/lspkind-nvim', after = 'nvim-cmp', opt = true } },
	after = 'LuaSnip',
	config = completion.cmp
}
plugins['L3MON4D3/LuaSnip'] = {
	event = 'InsertEnter',
	config = completion.snippets,
}
plugins['rafamadriz/friendly-snippets'] = {
	opt = true,
	after = 'LuaSnip',
	event = 'InsertEnter',
}
plugins['github/copilot.vim'] = {
	event = 'InsertEnter'
}
plugins["neovim/nvim-lspconfig"] = {
	opt = true,
	after = 'nvim-lsp-installer',
}
plugins['jose-elias-alvarez/null-ls.nvim'] = {
	opt = true,
	after = 'nvim-lspconfig',
	config = completion.null_ls
}
plugins['ray-x/lsp_signature.nvim'] = {
	opt = true,
	after = 'nvim-lspconfig',
	config = completion.signature,
}
plugins["williamboman/nvim-lsp-installer"] = {
	after = 'cmp-nvim-lsp',
	config = completion.lsp_installer
}
plugins['RishabhRD/nvim-lsputils'] = {
	opt = true,
	requires = { 'RishabhRD/popfix' },
	config = completion.lsputils,
}
plugins['michaelb/sniprun'] = {
	run = 'bash ./install.sh &'
}
plugins['folke/trouble.nvim'] = {
	opt = true,
	after = 'nvim-lspconfig'
}

plugins['mbbill/undotree'] = {
	event = 'TextChanged'
}
plugins['vimwiki/vimwiki'] = {
	opt = true,
	ft = 'markdown'
}
plugins['rhysd/accelerated-jk'] = {}
plugins['itchyny/vim-cursorword'] = {}
plugins['dstein64/vim-startuptime'] = {}
return plugins
