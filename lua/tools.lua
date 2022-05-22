vim.notify = require('notify')

require("notify").setup({
  -- Animation style (see below for details)
  stages = "slide",

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = nil,

  -- Function called when a window is closed
  on_close = nil,

  -- Render function for notifications. See notify-render()
  render = "default",

  -- Default timeout for notifications
  timeout = 500,

  background_colour = "#ffffff",

  -- Minimum width for notification windows
  minimum_width = 50,

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
require('notify')('Welcome!')


local actions = require('telescope.actions')
require('telescope').load_extension('zoxide')
require('telescope').setup({
	extensions = {},
	  mappings = {
		i = {
			["<esc>"] = actions.close,
		},
		n  = {
			["q"] = actions.close,
		}
	  }
})


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

