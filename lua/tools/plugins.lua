local tools = {
	 {"kyazdani42/nvim-tree.lua",config = function() require'nvim-tree'.setup()end, 
	 requires = {"kyazdani42/nvim-web-devicons"},},
	{"akinsho/toggleterm.nvim",opt = true},
	"glepnir/dashboard-nvim",
	"SmiteshP/nvim-gps",
	{"iamcco/markdown-preview.nvim",run = 'cd app && yarn install'},
	 {"nvim-telescope/telescope.nvim",
	 requires = { --Extensions
		 {"sharkdp/fd"},
		 {"BurntSushi/ripgrep"},
		 {'nvim-telescope/telescope-media-files.nvim'},
	 }},
	 "rcarriga/nvim-notify",
	 'vimwiki/vimwiki',
	 {"ellisonleao/glow.nvim",run=':GlowInstall'}, 
	 'numToStr/Navigator.nvim',
	 'dstein64/vim-startuptime',
 }
return tools


