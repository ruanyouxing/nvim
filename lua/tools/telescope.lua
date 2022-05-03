local actions = require('telescope.actions')
local trouble = require('trouble')
local telescope = require('telescope')
local cfg ={
extensions = {},
  mappings = {
	i = {
		["<esc>"] = actions.close,
		["<c-t>"] = trouble.open_with_trouble,
	}

  }
}


telescope.setup(cfg)
