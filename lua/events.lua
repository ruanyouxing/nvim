local events = {}
	local autocmd = vim.api.nvim_create_autocmd
	local augroups = vim.api.nvim_create_augroup
	local all = "*"
	local function silent(cmd) return "silent! ".. cmd end
	augroups('yank',{clear = true})
	augroups('autoload',{clear = true})
	augroups('specs',{clear = true})
	autocmd(
		{"cursormoved"},
		{pattern = "*",
		command = "IndentBlanklineRefresh"
	})
	autocmd({"textyankpost"}, {
		pattern = all,
		command = silent("lua vim.highlight.on_yank(higroup=\"incsearch\",timeout=301)"),
		group = "yank"
	})
	autocmd({"textchanged"}, {
		pattern = {".xresources"},
		command = silent("!xrdb ~/.xresources"),
		group = "autoload"
	})
	autocmd({"bufwinleave"},{
		pattern = all,
		command = silent('mkview'),
	})
	autocmd({"bufenter"},{
		pattern = all,
		command = silent('loadview'),
	})
	autocmd({"cursormoved"},{
		pattern = all,
		command  = silent("lua require('specs').show_specs()"),
		group = "specs"
	})

return events
