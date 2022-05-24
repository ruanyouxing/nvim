 local g = vim.g

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
   dashboard.button(  "t", ' > Terminal',   ':ToggleTerm<CR>'),
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "q", "  > Quit", ":qa<CR>"),
}

local function footer()
  require('plugin.packer_compiled')
  local plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  local version = vim.version()
    return '  '
    .. plugins
    ..' plugins  '
    ..datetime
    .. "   "
    .. "   v"
    .. version.major
    .. "."
    .. version.minor
    .. "."
    .. version.patch .. ' \n\t\t\t kill me pls'
end
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"
alpha.setup(dashboard.opts)


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


require("circles").setup({ icons = {
    empty = "",
    filled = "",
    lsp_prefix = ""
  },
  lsp = true
})


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
	lualine_z = {'location'},
}

local aerial = {
	sections = mini_sections,
	filetypes = {'aerial'},
}

require('lualine').setup({
	options = {
	    icons_enabled = true,
	    theme = 'auto',
	    disabled_filetypes = {},
	    component_separators = "|",
	},
	sections = {
	    lualine_a = {"mode"},
	    lualine_b = {{"branch"},
	    		{"diff"}},
	    lualine_c = {
		    {'lsp_progress'},
		    {gps_content, cond = gps.is_available},
		    {require('auto-session-library').current_session_name}
	    },
	    lualine_x = {
		{
		    "diagnostics",
		    sources = {'nvim_diagnostic'},
		    symbols = {error = " ", warn = " ", info = " "}
		}
	    },
	    lualine_y = {"filetype", "encoding", "fileformat"},
	    lualine_z = {"progress", "location"},
	},
	inactive_sections = {
	    lualine_a = {},
	    lualine_b = {},
	    lualine_c = {"filename"},
	    lualine_x = {"location"},
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


g.nord_contrast = true
g.nord_borders = true
g.nord_disable_background = false
g.nord_italic = true
g.nord_cursorline_transparent = true


g.tokyonight_style="night"
g.tokyonight_hide_inactive_statusline=1
g.tokyonight_italic_funtions=1
g.tokoynight_italic_variables=1
g.tokoynight_sidebars={"qf","vista_kind","terminal","packer"}

require('transparent').setup({
	enable = false,
	extra_groups = 'all',
})
