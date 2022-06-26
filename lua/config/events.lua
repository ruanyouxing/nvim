local events = {}
	local autocmd = vim.api.nvim_create_autocmd
	local augroups = vim.api.nvim_create_augroup
	local all = "*"
	local function silent(cmd) return "silent! ".. cmd end
	augroups('yank',{clear = true})
	augroups('autoload',{clear = true})
	augroups('specs',{clear = true})
	autocmd(
		{"CursorMoved"},
		{pattern = "*",
		command = "IndentBlanklineRefresh"
	})
	autocmd({"TextYankPost"}, {
		pattern = all,
		command = silent("lua vim.highlight.on_yank(higroup=\"incsearch\",timeout=301)"),
		group = "yank"
	})
	autocmd({"TextChanged"}, {
		pattern = {".xresources"},
		command = silent("!xrdb ~/.xresources"),
		group = "autoload"
	})
	autocmd({"BufWinLeave"},{
		pattern = all,
		command = silent('mkview'),
	})
	autocmd({"BufEnter"},{
		pattern = all,
		command = silent('loadview'),
	})
	autocmd({"CursorMoved"},{
		pattern = all,
		command  = silent("lua require('specs').show_specs()"),
		group = "specs"
	})
	autocmd({"VimEnter"},{
		pattern = all,
		command = silent("TwilightEnable"),
	})

return events
