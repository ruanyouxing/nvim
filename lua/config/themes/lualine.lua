vim.cmd[[packadd nvim-gps]]
vim.cmd[[packadd symbols-outline.nvim]]
local lualine = require('lualine')
local gps = require('nvim-gps')

local function gps_content()
if gps.is_available() then
    return gps.get_location()
else
    return ""
end
end

local symbols_outline = {
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'filetype'},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {'location'}
        },
        filetypes = {'Outline'}
}

local cfg = {
	options = {
            icons_enabled = true,
            theme = 'auto',
            disabled_filetypes = {},
            component_separators = "|",
 --           section_separators = {left = "", right = ""}
        },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {{"branch"}, {"diff"}},
            lualine_c = {
                {'lsp_progress'}, {gps_content, cond = gps.is_available}
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = {'nvim_diagnostic'},
                    symbols = {error = " ", warn = " ", info = " "}
                }
            },
            lualine_y = {"filetype", "encoding", "fileformat"},
            lualine_z = {"progress", "location"}
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
            "quickfix", "nvim-tree", "toggleterm", "fugitive", symbols_outline
        }
    }

lualine.setup(cfg)
