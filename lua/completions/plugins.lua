local completions = {
	{'hrsh7th/nvim-cmp',
	requires = {
	{'saadparwaiz1/cmp_luasnip',after = 'LuaSnip'},
	{'hrsh7th/cmp-nvim-lsp',after = 'cmp_luasnip'},
	{'hrsh7th/cmp-nvim-lua',after ='cmp-nvim-lsp'},
	{'hrsh7th/cmp-buffer',after = 'nvim-cmp'},
	{'f3fora/cmp-spell',after = 'nvim-cmp'},
	{'hrsh7th/cmp-path',after = 'nvim-cmp'},
	'L3MON4D3/LuaSnip',
	{'rafamadriz/friendly-snippets',after = 'nvim-cmp'},
}},
	'ray-x/lsp_signature.nvim',
	'folke/trouble.nvim',
	'onsails/lspkind-nvim',
	{'github/copilot.vim',cmd = "Copilot",opt = true},
	{'RishabhRD/nvim-lsputils', requires = 'RishabhRD/popfix'},
}

return completions
