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
		command = silent("lua vim.highlight.on_yank(higroup=\"IncSearch\",timeout=301)"),
		group = "yank"
	})
	autocmd({"TextChanged"}, {
		pattern = {".Xresources"},
		command = silent("!xrdb ~/.Xresources"),
		group = "autoload"
	})
	autocmd({"CursorMoved"},{
		pattern = all,
		command  = silent("lua require('specs').show_specs()"),
		group = "specs"
	})

return events
