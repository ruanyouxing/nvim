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
	shell="fish",
	close_on_exit = true,
})

local Terminal=require('toggleterm.terminal').Terminal
local lazygit=Terminal:new({cmd ="lazygit",hidden=true,direction="float",
	float_opts={border="double",
	},
})


function _lazygit_toggle()
	lazygit:toggle()
end

