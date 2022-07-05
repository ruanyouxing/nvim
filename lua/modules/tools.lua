local tools = {}
function tools.telescope()
	local actions = require('telescope.actions')
	require('telescope').load_extension('zoxide')
	require'telescope'.load_extension('notify')
	require('telescope').setup({
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
			n = {
				["q"] = actions.close,
			}
		}
	})
end

function tools.toggleterm()
	vim.cmd [[packadd toggleterm.nvim]]
	require('toggleterm').setup({
		size = 7,
		border = "curved",
		hide_numbers = true,
		shade_filetypes = { "none", "fzf" },
		shade_terminals = true,
		shading_factor = 1,
		start_in_insert = true,
		direction = "horizontal",
		persist_size = true,
		shell = "zsh",
		close_on_exit = true,
	})
end

return tools
