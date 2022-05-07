local config =  {}

function config.aerial()
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
	  treesitter = {
	    update_delay = 200,
	  },
	  markdown = {
	    update_delay = 200,
	  },
	})
end


function config.autopairs()
	require("nvim-autopairs").setup {
		check_ts = true,
	}
	    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	    local cmp = require("cmp")
	    cmp.event:on("confirm_done",
			 cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))
	    cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
end

function config.autosave()
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
	    }
	)
end

function config.autosession()
	require('auto-session').setup({
		log_level = 'info',
		auto_session_enable_last_session = true,
		auto_session_root_dir = vim.fn.stdpath('data') .. '/session',
		auto_session_enabled = true,
		auto_save_enabled = true,
		auto_restore_enable = true,
		auto_session_suppress_dirs = nil
	})
end

function config.blankline()
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
	    vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")
end

function config.better_escape()
	require('better_escape').setup({
		mapping = {'jk','jj'},
		timeout = 100,
		clear_empty_lines = true,
		keys = function()
			return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>' or '<esc>'
		end
	})
end


function config.bufferline()
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
		-- groups  = {
		-- 	options = {
		-- 		toggle_hidden_on_enter = true,
		-- 	},
		-- 	items = {
		-- 		name = "Tests",
		-- 		hightlight = {gui = "underline",guisp ="blue"},
		-- 		priority = 2,
		-- 		matcher = function(buf)
		-- 			return buf.filename:match('%_test') or buf.filename:match('%_spec')
		-- 		end,
		-- 	},
		-- 	{
		-- 		name = "Docs",
		-- 		hightlight  = {gui = "undercurl",guisp ="green"},
		-- 		auto_close = false,
		-- 		matcher = function(buf)
		-- 			return buf.filename:match('%.md') or buf.filename:match('%.txt')
		-- 		end,
		-- 		separator = {
		-- 			style = require('bufferline.groups').separator.tab
		-- 		},
		-- 	},
		-- },
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
end

function config.colorizer()
	vim.cmd[[packadd nvim-colorizer.lua]]
	vim.opt.termguicolors = true
	require('colorizer').setup()
end

function config.comments()
	require('nvim_comment').setup({
		comment_empty = false,
		create_mappings = true,
		line_mapping = "gcc",
		operator_mapping = "gc"
	})
end

function config.gitsigns()
	require("gitsigns").setup({
	  -- signs = {
	  --   add = {text = "▌"},
	  --   change = {text = "▌"},
	  --   delete = {text = "▌"},
	  --   topdelete = {text = "▌"},
	  --   changedelete = {text = "▌"}
	  -- },
	  preview_config = {border = "rounded"}
	})
end

function config.nvimtree()
	require('nvim-tree').setup()
end

function config.specs()
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

	require('specs').show_specs()
end

function config.treesitter()
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
end

function config.ts_context()
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
    exact_patterns = {
    }
}
end

function config.tabout()
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
end

function config.twilight()
local cfg = {
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
}

require('twilight').setup(cfg)
end

function config.wilder()
	vim.cmd[[
		call wilder#setup({'modes': [':', '/', '?']})
		call wilder#set_option('use_python_remote_plugin', 0)
		call wilder#set_option('pipeline', [wilder#branch(wilder#cmdline_pipeline({'use_python': 0,'fuzzy': 1, 'fuzzy_filter': wilder#lua_fzy_filter()}),wilder#vim_search_pipeline(), [wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({'draw': [{_, x -> ' ' . x}]})])])
		call wilder#set_option('renderer', wilder#renderer_mux({':': wilder#popupmenu_renderer({'highlighter': wilder#lua_fzy_highlighter(), 'left': [wilder#popupmenu_devicons()], 'right': [' ', wilder#popupmenu_scrollbar()]}), '/': wilder#wildmenu_renderer({'highlighter': wilder#lua_fzy_highlighter()})}))
	]]
end

function config.zenmode()
local zen_mode = require('zen-mode')

local cfg= {
  window = {
    backdrop = 0.8,
    width = 120,
    height = 1,
    options = {
    },
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
    },
  },
  on_open = function(win)
  end,
  on_close = function()
  end,
}
zen_mode.setup(cfg)
end
return config
