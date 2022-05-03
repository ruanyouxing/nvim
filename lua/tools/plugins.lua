local tools = {
	 {"kyazdani42/nvim-tree.lua",config = function() require'nvim-tree'.setup()end, 
	 requires = {"kyazdani42/nvim-web-devicons"},},
	{"akinsho/toggleterm.nvim",opt = true},
	"glepnir/dashboard-nvim",
	 {"nvim-telescope/telescope.nvim",
	 requires = { --Extensions
		 {"sharkdp/fd"},
		 {"BurntSushi/ripgrep"},
	 }},
	 "rcarriga/nvim-notify",
	 'vimwiki/vimwiki',
	 'dstein64/vim-startuptime',
	 {'iamcco/markdown-preview.nvim',run = 'cd app && yarn install'},
	 {'lewis6991/impatient.nvim', config = function() require'impatient'.enable_profile() end},
	 'xiyaowong/nvim-transparent'
 }
return tools


