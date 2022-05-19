require("aerial").setup({
	backends = { "treesitter", "lsp", "markdown" },
	close_behavior = "auto",
	default_bindings = true,
	default_direction = "prefer_right",
	disable_max_lines = 10000,
	disable_max_size = 10000000,
	filter_kind = {
		"Class",
		"Constructor",
		"Enum",
		"Function",
		"Interface",
		"Module",
		"Method",
		"Struct",
	},
	highlight_mode = "split_width",
	highlight_closest = true,
	highlight_on_hover = false,
	highlight_on_jump = 300,
	ignore = {
		unlisted_buffers = true,
		filetypes = {},
		buftypes = "special",
		wintypes = "special",
	},
	link_folds_to_tree = false,
	link_tree_to_folds = true,
	manage_folds = false,
	max_width = { 40, 0.2 },
	width = nil,
	min_width = 30,
	nerd_font = "auto",
	on_attach = nil,
	open_automatic = false,
	placement_editor_edge = false,
	post_jump_cmd = "normal! zz",
	close_on_select = false,
	show_guides = false,
	update_events = "TextChanged,InsertLeave",
	guides = {
		mid_item = "├─",
		last_item = "└─",
		nested_top = "│ ",
		whitespace = "  ",
	},
	float = {
		border = "rounded",
		relative = "cursor",
		max_height = 0.9,
		height = nil,
		min_height = { 8, 0.1 },
		override = function(conf)
		return conf
		end,
	},

	lsp = {
		diagnostics_trigger_update = true,
		update_when_errors = true,
		update_delay = 200,
	},
	treesitter = { update_delay = 200 },
	markdown = { update_delay = 200 },
})



require("nvim-autopairs").setup {
	check_ts = true,
}
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done",
	 cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"


local autosave = require("autosave")

autosave.setup(
{
	enabled = true,
	execution_message = "Changes saved at " .. vim.fn.strftime("%H:%M:%S"),
	events = {"InsertLeave", "TextChanged"},
	conditions = {
	    exists = true,
	    filename_is_not = {},
	    filetype_is_not = {},
	    modifiable = true
	},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 135
})

require('auto-session').setup({
	log_level = 'info',
	auto_session_enable_last_session = true,
	auto_session_root_dir = vim.fn.stdpath('data') .. '/session',
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enable = true,
	auto_session_suppress_dirs = nil
})


vim.opt.termguicolors = true
vim.opt.list = true
require("indent_blankline").setup {
	char = "│",
	show_first_indent_level = true,
	filetype_exclude = {
	    "startify", "dashboard", "dotooagenda", "log", "fugitive",
	    "gitcommit", "packer", "vimwiki", "markdown", "json", "txt",
	    "vista", "help", "todoist", "NvimTree", "peekaboo", "git",
	    "TelescopePrompt", "undotree", "flutterToolsOutline", "" -- for all buffers without a file type
	},
	buftype_exclude = {"terminal", "nofile"},
	show_trailing_blankline_indent = false,
	show_current_context = true,
	context_patterns = {
	    "class", "function", "method", "block", "list_literal", "selector",
	    "^if", "^table", "if_statement", "while", "for", "type", "var",
	    "import"
	},
	space_char_blankline = " "
	}

vim.cmd[[packadd better-escape.nvim]]
require('better_escape').setup({
	mapping = {'jk','jj'},
	timeout = 100,
	clear_empty_lines = true,
	keys = function()
		return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>' or '<esc>'
	end
})



require('bufferline').setup({
	options = {
		numbers = "ordinal",
		close_command = "bd! %d",
		right_mouse_command = "bd! %d",
		middle_mouse_command = nil,
		name_formatter = function(buf)
			if buf.name:match('%.md') then
				return vim.fn.fnamemodify(buf.name,':t:r')
			end
		end,
		nax_name_length = 20,
		max_prefix_length = 20,
		tab_size = 20,
		buffer_close_icon = '柳',
		modified_icon = '',
		diagnostics = 'nvim-lsp',
		diagnostics_update_in_insert = true,
		diagnostics_indicator = function(count,level,diagnostics_dict,context)
			return "("..count..")"
		end,
		show_buffer_icons = true,
		separator_style = "slant",
		always_show_bufferline = true,
		sort_by = "id",
	groups = {
	  options = {
	    toggle_hidden_on_enter = true
	},
	  items = {
	    {
	      name = "Tests",
	      highlight = {gui = "underline", guisp = "blue"}, -- Optional
	      priority = 2, 	      icon = "", -- Optional
	      matcher = function(buf) -- Mandatory
		return buf.filename:match('%_test') or buf.filename:match('%_spec')
	      end,
	    },
	    {
	      name = "Docs",
	      highlight = {gui = "undercurl", guisp = "green"},
	      auto_close = false,
	      matcher = function(buf)
		return buf.filename:match('%.md') or buf.filename:match('%.txt')
	      end,
	      separator = { -- Optional
		style = require('bufferline.groups').separator.tab
	      },
	    }
	}
	},
	offsets = {
	  {
	    filetype = "Outline",
	    text = "Outline",
	    highlight = "Directory",
	    text_align = "left"
	  },
	  {
		  filetype = "NvimTree",
		  text = "Explorer",
		  highlight = "Directory",
		  text_align = "left"
	  },
	  {
		  filetype = "minimap",
		  text = "Minimap",
		  highlight = "Directory",
		  text_align = "left"
	  }
	  }
	}
})


vim.cmd[[packadd nvim-colorizer.lua]]
require('colorizer').setup()

local cb = require'diffview.config'.diffview_callback
require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = true,         -- Requires nvim-web-devicons
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    position = "left",
    width = 35,
    height = 10,
    listing_style = "tree",
    tree_options = {
      flatten_dirs = true,
      folder_statuses = "only_folded",
    },
  },
  file_history_panel = {
    position = "bottom",
    width = 35,
    height = 16,
    log_options = {
	      max_count = 256,
	      follow = false,
	      all = false,
	      merges = false,
	      no_merges = false,
	      reverse = false,
    },
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},         -- See ':h diffview-config-hooks'
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    view = {
      ["<tab>"]      = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]    = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["gf"]         = cb("goto_file"),          -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = cb("goto_file_split"),    -- Open the file in a new split
      ["<C-w>gf"]    = cb("goto_file_tab"),      -- Open the file in a new tabpage
      ["<leader>e"]  = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"]  = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),           -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),           -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),         -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"),   -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),            -- Stage all entries.
      ["U"]             = cb("unstage_all"),          -- Unstage all entries.
      ["X"]             = cb("restore_entry"),        -- Restore entry to the state on the left side.
      ["R"]             = cb("refresh_files"),        -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["i"]             = cb("listing_style"),        -- Toggle between 'list' and 'tree' views
      ["f"]             = cb("toggle_flatten_dirs"),  -- Flatten empty subdirectories in tree listing style.
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    file_history_panel = {
      ["g!"]            = cb("options"),            -- Open the option panel
      ["<C-A-d>"]       = cb("open_in_diffview"),   -- Open the entry under the cursor in a diffview
      ["y"]             = cb("copy_hash"),          -- Copy the commit hash of the entry under the cursor
      ["zR"]            = cb("open_all_folds"),
      ["zM"]            = cb("close_all_folds"),
      ["j"]             = cb("next_entry"),
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    option_panel = {
      ["<tab>"] = cb("select"),
      ["q"]     = cb("close"),
    },
  },
}

require('nvim_comment').setup({
	comment_empty = false,
	create_mappings = true,
	line_mapping = "gcc",
	operator_mapping = "gc"
})

require('pretty-fold.preview').setup({
	default_keybindings = true,
   	border = {' ', '', ' ', ' ', ' ', ' ', ' ', ' '},
})

require("gitsigns").setup({
	signs = {
	  add = {text = "▌"},
	  change = {text = "▌"},
	  delete = {text = "▌"},
	  topdelete = {text = "▌"},
	  changedelete = {text = "▌"}
	},
	preview_config = {border = "rounded"},
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol',
		delay = 100,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y:%m-%d>, <summary>',
})
require('pretty-fold.preview').setup()
require('pretty-fold').setup(
{
   custom_function_arg = 'Folding',

   sections = {
      left = {
         'content',
      },
      right = {
         ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
         function(config) return config.fill_char:rep(3) end
      }
   },
   fill_char = '•',

   remove_fold_markers = true,

   -- Keep the indentation of the content of the fold string.
   keep_indentation = true,

   -- Possible values:
   -- "delete" : Delete all comment signs from the fold string.
   -- "spaces" : Replace all comment signs with equal number of spaces.
   -- false    : Do nothing with comment signs.
   process_comment_signs = 'spaces',

   -- Comment signs additional to the value of `&commentstring` option.
   comment_signs = {},

   -- List of patterns that will be removed from content foldtext section.
   stop_words = {
      '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
   },

   add_close_pattern = true, -- true, 'last_line' or false

   matchup_patterns = {
      {  '{', '}' },
      { '%(', ')' }, -- % to escape lua pattern char
      { '%[', ']' }, -- % to escape lua pattern char
   },

   ft_ignore = { 'neorg' },
})

require('nvim-tree').setup()


require('specs').setup{
	show_jumps  = true,
	min_jump = 10,
	popup = {
		delay_ms = 0,
		inc_ms = 10,
		blend = 10,
		width = 10,
		winhl = "PMenu",
		fader = require('specs').pulse_fader,
		resizer = require('specs').shrink_resizer,
	},
	ignore_filetypes = {},
	ignore_buftypes = { nofile = true },
}
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
	refactor = {
	    highlight_definitions = {enable = true},
	    highlight_current_scope = {enable = true},
	    smart_rename = {
	      enable = true,
	      keymaps = {
		smart_rename = "grr",
	      },
	    },
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			 keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
 		    },
		},
		 swap = {
		        enable = true,
		        swap_next = {
				  ["<leader>a"] = "@parameter.inner",
		        },
		        swap_previous = {
				["<leader>A"] = "@parameter.inner",
		      	},
 	   	},
		move = {
		      enable = true,
		      set_jumps = true, -- whether to set jumps in the jumplist
		      goto_next_start = {
			["]m"] = "@function.outer",
			["]]"] = "@class.outer",
		      },
		      goto_next_end = {
			["]M"] = "@function.outer",
			["]["] = "@class.outer",
		      },
		      goto_previous_start = {
			["[m"] = "@function.outer",
			["[["] = "@class.outer",
		      },
		      goto_previous_end = {
			["[M"] = "@function.outer",
			["[]"] = "@class.outer",
 	        },
    	},
		lsp_interop = {
		      enable = true,
		      border = 'none',
		      peek_definition_code = {
			["<leader>df"] = "@function.outer",
			["<leader>dF"] = "@class.outer",
                },
        },
	},
}
require'treesitter-context'.setup{
	enable = true,
	throttle = true,
	max_lines = 0,
	patterns = {
	default = {
		'class',
		'function',
		'method',
		'for',
		'while',
		'if',
		'switch',
		'case',
	},
},
	exact_patterns = {}
}


require('tabout').setup({
	tabkey = '<C-l>',
	backwards_tabkey = '<C-h>',
	ignore_beginning = false,
	act_as_tab = true,
	enable_backward = true,
	completion = true,
	tabouts = {
		{ open = "'", close = "'" },
		{ open = '"', close = '"' },
		{ open = "`", close = "`" },
		{ open = "(", close = ")" },
		{ open = "{", close = "}" },
		{ open = "<", close = ">" },
	},
	exclude = {},
})



require('twilight').setup({
	dimming = {
	alpha = 0.25, -- amount of dimming
	color = { "Normal", "#ffffff" },
	inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
	},
	context = 10, -- amount of lines we will try to show around the current line
	treesitter = true,
	expand = {
		"function",
		"method",
		"table",
		"if_statement",
	},
	exclude = {},
})


vim.cmd[[
	call wilder#setup({'modes': [':', '/', '?']})
	call wilder#set_option('use_python_remote_plugin', 0)
	call wilder#set_option('pipeline', [wilder#branch(wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),wilder#vim_search_pipeline(), [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})])])
	call wilder#set_option('renderer', wilder#renderer_mux({':': wilder#popupmenu_renderer({'highlighter': wilder#lua_fzy_highlighter(), 'left': [wilder#popupmenu_devicons()], 'right': [' ', wilder#popupmenu_scrollbar()]}), '/': wilder#wildmenu_renderer({'highlighter': wilder#lua_fzy_highlighter()})}))
]]


local zen_mode = require('zen-mode')

zen_mode.setup({
	window = {
		backdrop = 0.8,
		width = 120,
		height = 1,
		options = {},
	},
	plugins = {
		options = {
			enabled = true,
			ruler = false, -- disables the ruler text in the cmd line area
	showcmd = false, -- disables the command in the last line of the screen
	},
	twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
	gitsigns = { enabled = false},
	tmux = { enabled = false }, -- disables the tmux statusline
	kitty = {
	enabled = false,
	font = "+4", -- font size increment
	}},
	on_open = function(win)
	end,
	on_close = function()
	end,
})
