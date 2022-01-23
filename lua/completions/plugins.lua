local completions = {
	{'hrsh7th/nvim-cmp',
	requires = {{'hrsh7th/cmp-path',after = 'nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp',after = 'nvim-cmp'},
	{'hrsh7th/cmp-buffer',after = 'nvim-cmp'},
	{'hrsh7th/cmp-nvim-lua',after ='nvim-cmp'},
	{'f3fora/cmp-spell',after = 'nvim-cmp'},
	{'tzachar/cmp-tabnine', run = './install.sh'},
	{'saadparwaiz1/cmp_luasnip',after = 'nvim-cmp'},
	{'L3MON4D3/LuaSnip',opt = true},
	{'rafamadriz/friendly-snippets',after = 'nvim-cmp'},
}},
	'ray-x/lsp_signature.nvim',
	'folke/trouble.nvim',
	{'onsails/lspkind-nvim', after = 'nvim-cmp'},
}

return completions
