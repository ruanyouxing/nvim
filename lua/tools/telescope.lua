local actions = require('telescope.actions')
local trouble = require('trouble')
local telescope = require('telescope')
local cfg ={
extensions = {
    media_files = {
      -- defaults to {"png", "jpg", "mp5", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "fd" -- find command (defaults to `fd`)
    },
  },
  mappings = {
	i = {
		["<esc>"] = actions.close,
		["<c-t>"] = trouble.open_with_trouble,
	}

  }
}


telescope.setup(cfg)
telescope.load_extension('media_files')
