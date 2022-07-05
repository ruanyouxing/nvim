local ui = {}

function ui.alpha()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣤⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠟⠉⠉⠉⠉⠉⠉⠉⠙⠻⢶⣄⠀⠀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣷⡀⠀⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡟⠀⣠⣶⠛⠛⠛⠛⠛⠛⠳⣦⡀⠀⠘⣿⡄⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠁⠀⢹⣿⣦⣀⣀⣀⣀⣀⣠⣼⡇⠀⠀⠸⣷⠀⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡏⠀⠀⠀⠉⠛⠿⠿⠿⠿⠛⠋⠁⠀⠀⠀⠀⣿⡄ ]],
		[[⠀⠀      ⢠⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡇⠀]],
		[[      ⠀⠀⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀]],
		[[⠀⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀]],
		[[⠀⠀⠀⠀⠀⠀⢰⣿⠀⠀⠀⠀⣠⡶⠶⠿⠿⠿⠿⢷⣦⠀⠀⠀⠀⠀⠀⠀⣿⠀]],
		[[⠀    ⠀⣸⡇⠀⠀⠀⠀⣿⡀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⣿⠀]],
		[[⣠⡿⠛⠛⠛⠛⠻⠀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⣿⠇⠀⠀⠀⠀⠀⠀⣿⠀]],
		[[ ⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡟⠀⠀⢀⣤⣤⣴⣿⠀⠀⠀⠀⠀⠀⠀⣿⠀]],
		[[  ⢷⣶⣦⣤⣤⣤⣴⣶⣾⠿⠛⠁⢀⣶⡟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀]],
		[[          ⠀⠀⠀⠀⠈⣿⣆⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⡾⠃⠀]],
		[[          ⠀⠀⠀⠀⠀⠈⠛⠻⢿⣿⣾⣿⡿⠿⠟⠋⠁⠀⠀⠀]],
		[[                              ]],
	}

	dashboard.section.buttons.val = {
		dashboard.button("t", ' > Terminal', ':ToggleTerm<CR>'),
		dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
		dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
		dashboard.button("q", "  > Quit", ":qa<CR>"),
	}

	local function footer()
		package.path = vim.fn.stdpath('config') .. '/plugin/?.lua;' .. package.path
		local plugins = #vim.tbl_keys(packer_plugins)
		local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
		local version = vim.version()
		return '  '
		    .. plugins
		    .. ' plugins  '
		    .. datetime
		    .. "   "
		    .. "   v"
		    .. version.major
		    .. "."
		    .. version.minor
		    .. "."
		    .. version.patch .. ' \n\t\t\t kill me pls'
	end

	dashboard.section.footer.val = footer()
	alpha.setup(dashboard.opts)
end

function ui.blankline()
	vim.opt.termguicolors = true
	vim.opt.list = true
	require("indent_blankline").setup {
		char = "│",
		show_first_indent_level = true,
		filetype_exclude = {
			"startify", "alpha", "dotooagenda", "log", "fugitive",
			"gitcommit", "packer", "vimwiki", "markdown", "json", "txt",
			"vista", "help", "todoist", "NvimTree", "peekaboo", "git",
			"TelescopePrompt", "undotree", "flutterToolsOutline", "" -- for all buffers without a file type
		},
		buftype_exclude = { "terminal", "nofile" },
		show_trailing_blankline_indent = false,
		show_current_context = true,
		context_patterns = {
			"class", "function", "method", "block", "list_literal", "selector",
			"^if", "^table", "if_statement", "while", "for", "type", "var",
			"import"
		},
		space_char_blankline = " "
	}
end

function ui.bufferline()
	require('bufferline').setup({
		options = {
			numbers = "ordinal",
			close_command = "bd! %d",
			right_mouse_command = "bd! %d",
			middle_mouse_command = nil,
			name_formatter = function(buf)
				if buf.name:match('%.md') then
					return vim.fn.fnamemodify(buf.name, ':t:r')
				end
			end,
			nax_name_length = 20,
			max_prefix_length = 20,
			tab_size = 20,
			buffer_close_icon = '柳',
			modified_icon = '',
			diagnostics = 'nvim-lsp',
			diagnostics_update_in_insert = true,
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				return "(" .. count .. ")"
			end,
			show_buffer_icons = true,
			separator_style = "thin",
			always_show_bufferline = true,
			sort_by = "id",
			groups = {
				options = {
					toggle_hidden_on_enter = true
				},
				items = {
					{
						name = "Tests",
						highlight = { gui = "underline", guisp = "blue" }, -- Optional
						priority = 2, icon = "", -- Optional
						matcher = function(buf) -- Mandatory
							return buf.filename:match('%_test') or buf.filename:match('%_spec')
						end,
					},
					{
						name = "Docs",
						highlight = { gui = "undercurl", guisp = "green" },
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

function ui.catppuccin()
	local catppuccin = require('catppuccin')
	catppuccin.setup({
		term_colors = true,
		transparent_background = false,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			string = "bold",
			variables = "italic",
		},
		integrations = {
			nvimtree = {
				enable = true,
				show_root = true,
			},
			bufferline = true,
			telescope = true,
		}
	})
	vim.g.catppuccin_flavour = 'mocha'
end

function ui.circles()
	require("circles").setup({ icons = {
		empty = "",
		filled = "",
		lsp_prefix = ""
	},
		lsp = true
	})
end

function ui.gps()
	require('nvim-gps').setup({
		icons = {
			['class-name'] = " ",
			['function-name'] = " ",
			['method-name'] = " ",
		},
		languages = {
			['c'] = true,
			['cpp'] = true,
			['java'] = true,
			['javascript'] = true,
			['lua'] = true,
			['python'] = true,
			['rust'] = true,
		},
		separator = ' >> ',
	})
end

function ui.lualine()
	local gps = require('nvim-gps')
	local function gps_content()
		if gps.is_available() then
			return gps.get_location()
		else
			return ""
		end
	end

	local mini_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { 'location' },
	}

	local aerial = {
		sections = mini_sections,
		filetypes = { 'aerial' },
	}

	require('lualine').setup({
		options = {
			icons_enabled = true,
			theme = 'auto',
			disabled_filetypes = {},
			component_separators = "|",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { { "branch" },
				{ "diff" } },
			lualine_c = {
				{ 'lsp_progress' },
				{ gps_content, cond = gps.is_available },
				{ require('auto-session-library').current_session_name }
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { 'nvim_diagnostic' },
					symbols = { error = " ", warn = " ", info = " " }
				}
			},
			lualine_y = { "filetype", "encoding", "fileformat" },
			lualine_z = { "progress", "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		extensions = {
			"quickfix",
			"nvim-tree",
			"toggleterm",
			"fugitive",
			aerial,
		}
	})
end

function ui.nightfox()
	require('nightfox').setup({
		palettes = {
			duskfox = {
				bg1 = "#000000", -- Black background
				bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
				bg3 = "#121820", -- 55% darkened from stock
				sel0 = "#131b24", -- 55% darkened from stock
			},
		},
		specs = {
			all = {
				inactive = "bg0", -- Default value for other styles
			},
			duskfox = {
				inactive = "#090909", -- Slightly lighter then black background
			} } })
end

function ui.nord()
	vim.g.nord_contrast = true
	vim.g.nord_borders = true
	vim.g.nord_disable_background = false
	vim.g.nord_italic = true
	vim.g.nord_cursorline_transparent = true
end

function ui.notify()
	vim.notify = require('notify')
	require("notify").setup({
		stages = "slide",
		on_open = nil,
		on_close = nil,
		render = "default",
		timeout = 500,
		background_colour = "#ffffff",
		minimum_width = 50,
		icons = {
			ERROR = "",
			WARN = "",
			INFO = "",
			DEBUG = "",
			TRACE = "✎",
		},
	})
	require('notify')('Welcome!')
end

function ui.tokyonight()
	vim.g.tokyonight_style = "storm"
	vim.g.tokyonight_hide_inactive_statusline = 1
	vim.g.tokyonight_italic_funtions = 1
	vim.g.tokyonight_italic_variables = 1
	vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
end

function ui.transparent()
	require('transparent').setup({
		enable = false,
		extra_groups = 'all',
	})
end
function ui.twilight()
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
	vim.cmd [[TwilightEnable]]
end

function ui.wilder()
	local wilder = require("wilder")
	wilder.setup({ modes = { ":", "/", "?" } })
	local gradient = {
		"#f4468f",
		"#fd4a85",
		"#ff507a",
		"#ff566f",
		"#ff5e63",
		"#ff6658",
		"#ff704e",
		"#ff7a45",
		"#ff843d",
		"#ff9036",
		"#f89b31",
		"#efa72f",
		"#e6b32e",
		"#dcbe30",
		"#d2c934",
		"#c8d43a",
		"#bfde43",
		"#b6e84e",
		"#aff05b",
	}

	for i, fg in ipairs(gradient) do
		gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
	end
	wilder.set_option("pipeline", {
		wilder.branch(
			wilder.cmdline_pipeline({
				fuzzy = 1,
			}),
			wilder.python_file_finder_pipeline({
				-- to use ripgrep : {'rg', '--files'}
				-- to use fd      : {'fd', '-tf'}
				file_command = { "rg", "--files" }, --  { "find", ".", "-type", "f", "-printf", "%P\n" },
				-- to use fd      : {'fd', '-td'}
				dir_command = { "fd", "-tf" }, -- { "find", ".", "-type", "d", "-printf", "%P\n" },
				-- use {'cpsm_filter'} for performance, requires cpsm vim plugin
				-- found at https://github.com/nixprime/cpsm
				filters = { "fuzzy_filter", "difflib_sorter" },
			}),

			wilder.python_search_pipeline()
		-- wilder.python_search_pipeline({
		--   pattern = wilder.python_fuzzy_pattern(), --python_fuzzy_delimiter_pattern()
		--   sorter = wilder.python_difflib_sorter(),
		--   engine = "re",
		-- })
		),
	})
	local highlighters = {
		wilder.highlighter_with_gradient({
			wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
		}),
		wilder.basic_highlighter(),
	}
	wilder.set_option(
		"renderer",
		wilder.renderer_mux({
			[":"] = wilder.popupmenu_renderer({
				highlights = { gradient = gradient },
				min_height = "5%",
				max_height = "35%",
				highlighter = highlighters,
			}),
			["/"] = wilder.wildmenu_renderer({
				highlighter = highlighters,
			}),
		})
	)
end

return ui
