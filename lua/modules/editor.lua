local editor = {}
function editor.autopairs()
	require("nvim-autopairs").setup {
		check_ts = true,
	}
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	cmp.event:on("confirm_done",
		cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

function editor.autosave()
	local autosave = require("autosave")
	autosave.setup(
		{
			enabled = true,
			execution_message = "Changes saved at " .. vim.fn.strftime("%H:%M:%S"),
			events = { "InsertLeave", "TextChanged" },
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
end

function editor.autosession()
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

function editor.better_escape()
	vim.cmd [[packadd better-escape.nvim]]
	require('better_escape').setup({
		mapping = { 'jk', 'jj' },
		timeout = 100,
		clear_empty_lines = true,
		keys = function()
			return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>' or '<esc>'
		end
	})
end

function editor.diffview()
	local cb = require 'diffview.config'.diffview_callback
	require 'diffview'.setup {
		diff_binaries = false, -- Show diffs for binaries
		enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
		use_icons = true, -- Requires nvim-web-devicons
		icons = { -- Only applies when use_icons is true.
			folder_closed = "",
			folder_open = "",
		},
		signs = {
			fold_closed = "",
			fold_open = "",
		},
		default_args = { -- Default args prepended to the arg-list for the listed commands
			DiffviewOpen = {},
			DiffviewFileHistory = {},
		},
		hooks = {}, -- See ':h diffview-config-hooks'
		key_bindings = {
			disable_defaults = false, -- Disable the default key bindings
			view = {
				["<tab>"]      = cb("select_next_entry"), -- Open the diff for the next file
				["<s-tab>"]    = cb("select_prev_entry"), -- Open the diff for the previous file
				["gf"]         = cb("goto_file"), -- Open the file in a new split in previous tabpage
				["<C-w><C-f>"] = cb("goto_file_split"), -- Open the file in a new split
				["<C-w>gf"]    = cb("goto_file_tab"), -- Open the file in a new tabpage
				["<leader>e"]  = cb("focus_files"), -- Bring focus to the files panel
				["<leader>b"]  = cb("toggle_files"), -- Toggle the files panel.
			},
			file_history_panel = {
				["g!"]            = cb("options"), -- Open the option panel
				["<C-A-d>"]       = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
				["y"]             = cb("copy_hash"), -- Copy the commit hash of the entry under the cursor
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
			} } }
end

function editor.comment()
	require('nvim_comment').setup({
		comment_empty = false,
		create_mappings = true,
		line_mapping = "gcc",
		operator_mapping = "gc"
	})
end

function editor.gitsigns()
	require("gitsigns").setup({
		signs = {
			add = { text = "▌" },
			change = { text = "▌" },
			delete = { text = "▌" },
			topdelete = { text = "▌" },
			changedelete = { text = "▌" }
		},
		preview_config = { border = "rounded" },
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'eol',
			delay = 100,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = '<author>, <author_time:%Y:%m-%d>, <summary>',
	})
end

function editor.symbols_outline()
	-- init.lua
	vim.g.symbols_outline = {
		highlight_hovered_item = true,
		show_guides = true,
		auto_preview = true,
		position = 'right',
		relative_width = true,
		width = 25,
		auto_close = false,
		show_numbers = false,
		show_relative_numbers = false,
		show_symbol_details = true,
		preview_bg_highlight = 'Pmenu',
		keymaps = { -- These keymaps can be a string or a table for multiple keys
			close = { "<Esc>", "q" },
			goto_location = "<Cr>",
			focus_location = "o",
			hover_symbol = "<C-space>",
			toggle_preview = "K",
			rename_symbol = "r",
			code_actions = "a",
		},
		lsp_blacklist = {},
		symbol_blacklist = {},
		symbols = {
			File = { icon = "", hl = "TSURI" },
			Module = { icon = "", hl = "TSNamespace" },
			Namespace = { icon = "", hl = "TSNamespace" },
			Package = { icon = "", hl = "TSNamespace" },
			Class = { icon = "𝓒", hl = "TSType" },
			Method = { icon = "ƒ", hl = "TSMethod" },
			Property = { icon = "", hl = "TSMethod" },
			Field = { icon = "", hl = "TSField" },
			Constructor = { icon = "", hl = "TSConstructor" },
			Enum = { icon = "ℰ", hl = "TSType" },
			Interface = { icon = "ﰮ", hl = "TSType" },
			Function = { icon = "", hl = "TSFunction" },
			Variable = { icon = "", hl = "TSConstant" },
			Constant = { icon = "", hl = "TSConstant" },
			String = { icon = "𝓐", hl = "TSString" },
			Number = { icon = "#", hl = "TSNumber" },
			Boolean = { icon = "⊨", hl = "TSBoolean" },
			Array = { icon = "", hl = "TSConstant" },
			Object = { icon = "⦿", hl = "TSType" },
			Key = { icon = "🔐", hl = "TSType" },
			Null = { icon = "NULL", hl = "TSType" },
			EnumMember = { icon = "", hl = "TSField" },
			Struct = { icon = "𝓢", hl = "TSType" },
			Event = { icon = "🗲", hl = "TSType" },
			Operator = { icon = "+", hl = "TSOperator" },
			TypeParameter = { icon = "𝙏", hl = "TSParameter" }
		}
	}
end

function editor.specs()
	require('specs').setup {
		show_jumps       = true,
		min_jump         = 10,
		popup            = {
			delay_ms = 0,
			inc_ms = 10,
			blend = 10,
			width = 10,
			winhl = "PMenu",
			fader = require('specs').pulse_fader,
			resizer = require('specs').shrink_resizer,
		},
		ignore_filetypes = {},
		ignore_buftypes  = { nofile = true },
	}
end

function editor.treesitter()
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
			filetypes = { "html", "xml" },
		},
		matchup = {
			enable = true,
		},
		refactor = {
			highlight_definitions = { enable = true },
			highlight_current_scope = { enable = true },
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
				} } } }
end

function editor.ts_context()
	vim.cmd [[packadd nvim-treesitter-context]]
	require 'treesitter-context'.setup {
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
			} },
		exact_patterns = {}
	}
end

function editor.tabout()
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

function editor.ufo()
	require 'ufo'.setup({
		open_fold_hl_timeout = 200,
		provider_selector = function(bufnr, filetype)
			return { 'lsp', 'treesitter' }
		end
	})
end

return editor
