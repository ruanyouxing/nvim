local catppuccin=require('catppuccin')
 catppuccin.setup({
	 term_colors=true,
	 transparent_background=false,
	 styles={
		 comments="italic",
		 functions="italic",
		 keywords="italic",
		 string="bold",
		 variables="italic",
	 },
	 integrations={
		 nvimtree={
			 enable=true,
			 show_root=true,
		 },
		 bufferline=true,
		 telescope=true,
	 }
 })

