local config = {}
function config.notify()
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

function config.telescope()
local actions = require('telescope.actions')
require('telescope').load_extension('zoxide')
require('telescope').load_extension('frecency')
require('telescope').setup({
	  mappings = {
		i = {
			["<esc>"] = actions.close,
		},
		n  = {
			["q"] = actions.close,
		}
	  }
})
end

function config.toggleterm()
vim.cmd[[packadd toggleterm.nvim]]
require('toggleterm').setup({
	size=7,
	border = "curved",
	hide_numbers = true,
	shade_filetypes = {"none","fzf"},
	shade_terminals = true,
	shading_factor = 1,
	start_in_insert = true,
	direction ="horizontal",
	persist_size = true,
	shell="zsh",
	close_on_exit = true,
})
end

return config
