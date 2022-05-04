require("nvim-treesitter.configs").setup {
   ensure_installed = {
	   "bash",
	   "c",
	   "cpp",
	   "fish",
	   "lua",
	   "json",
	   "yaml",
	   "make",
	   "python",
	   "rust",
	   "html",
	   "javascript",
	   "typescript",
	   "css",
   },
   sync_install = true,

    highlight = {
	    enable = true,
    },
    rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    },
    autotag = {
	    enable = true,
	    filetypes = {"html","xml"},
    },
    matchup = {
	    enable = true,
    },
    textobjects = {
	select = {
		enable = true,
	},
    },
    refactor = {
	    highlight_definitions = {enable = true},
	    highlight_current_scope = {enable = true},
	    smart_rename = {
	      enable = true,
	      keymaps = {
		smart_rename = "grr",
	      },
	    },
	navigation = {
	      enable = true,
	      keymaps = {
		goto_definition = "gnd",
		list_definitions = "gnD",
		list_definitions_toc = "gO",
		goto_next_usage = "<a-*>",
		goto_previous_usage = "<a-#>",
	 },
    },
    }
}
