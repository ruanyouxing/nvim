config = {}
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

function config.nvim_gps()
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
		separator = ' > ',
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
		    lualine_b = {{"branch"}, {"diff"}},
		    lualine_c = {
			    {'lsp_progress'}, {gps_content, cond = gps.is_available},{require('auto-session-library').current_session_name}
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

function config.nord()
	local g = vim.g
	g.nord_contrast = true
	g.nord_borders = true
	g.nord_disable_background = false
	g.nord_italic = true
	g.nord_cursorline_transparent = true
end

function config.rose_pine()
	-- Set theme variant
	-- Matches terminal theme if unset
	-- @usage 'main' | 'moon' | 'dawn'
	local g = vim.g
	g.rose_pine_variant = 'main'

	g.rose_pine_bold_vertical_split_line = false
	g.rose_pine_inactive_background = false
	g.rose_pine_disable_background = false
	g.rose_pine_disable_float_background = false
	g.rose_pine_disable_italics = false

	local p = require('rose-pine.palette')
	g.rose_pine_colors = {
		punctuation = p.subtle,
		comment = p.subtle,
		hint = p.iris,
		info = p.foam,
		warn = p.gold,
		error = p.love,

		-- Or set all headings to one colour: `headings = p.text`
		headings = {
			h1 = p.iris,
			h2 = p.foam,
			h3 = p.rose,
			h4 = p.gold,
			h5 = p.pine,
			h6 = p.foam,
		},
	}

	-- Set colorscheme after options
end

function config.tokyonight()
	vim.g.tokyonight_style="night"
	vim.g.tokyonight_hide_inactive_statusline=1
	vim.g.tokyonight_italic_funtions=1
	vim.g.tokoynight_italic_variables=1
	vim.g.tokoynight_sidebars={"qf","vista_kind","terminal","packer"}

end

function config.vscodetheme()
	vim.g.vscode_style = 'dark'
	vim.g.vscode_italic_comment = 1
	--vim.g.vscode_transparent = 0
end


return config
