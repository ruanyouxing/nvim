local config = {}

function config.alpha()
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
	package.path = vim.fn.stdpath('config')..'/plugin/?.lua;'..package.path
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
alpha.setup(dashboard.opts)
end

function config.catppuccin()
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
 end

function config.circles()
require("circles").setup({ icons = {
    empty = "",
    filled = "",
    lsp_prefix = ""
  },
  lsp = true
})
end

function config.gps()
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
function config.lualine()
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
end

function config.nightfox()
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
}}})
end

function config.nord()
	vim.g.nord_contrast = true
	vim.g.nord_borders = true
	vim.g.nord_disable_background = false
	vim.g.nord_italic = true
	vim.g.nord_cursorline_transparent = true
end

function config.tokyonight()
vim.g.tokyonight_style="storm"
vim.g.tokyonight_hide_inactive_statusline=1
vim.g.tokyonight_italic_funtions=1
vim.g.tokyonight_italic_variables=1
vim.g.tokyonight_sidebars={"qf","vista_kind","terminal","packer"}
end

function config.transparent()
require('transparent').setup({
	enable = false,
	extra_groups = 'all',
})
end

return config
