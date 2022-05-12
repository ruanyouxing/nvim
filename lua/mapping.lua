local mapping = {}
local map = vim.api.nvim_set_keymap
local opts= {silent=true,noremap=true}
vim.opt.timeoutlen = 97

function mapping.shortcuts()
	local function plug(cmd) return string.format('<Plug>%s',cmd) end
	local function nmap(key,cmd) return map('n',key,cmd,opts) end
	nmap('j',plug('(accelerated_jk_j)'))
	nmap('k',plug('(accelerated_jk_k)'))
	nmap('<Space>','<NOP>')
	vim.g.mapleader =  " "
	nmap('D','d$')
	nmap('B','0')
	nmap('<C-a>',"ggVG")
end

function mapping.commands()
	local function nmap(key,cmd) return map('n',key,string.format(':%s<CR>',cmd),opts) end
	local function ctrl(key) return string.format('<C-%s>',key) end
	local function alt(key) return string.format('<A-%s>',key) end
	local function leader(key) return string.format('<leader>%s',key) end
	nmap(ctrl('b'),ctrl('w'))
	nmap('lg','lua _lazygit_toggle()')
	nmap('U','UndotreeShow')

	nmap(ctrl('n'),"NvimTreeToggle")
	nmap(ctrl(string.sub(alt('p'),4,-2)),"Telescope")
	nmap(ctrl('r'),"source %")
	nmap(ctrl('s'),'AerialToggle')
	nmap('T','TroubleToggle')
	nmap(ctrl('w'),'lua require("bufdelete").bufdelete(0, true)')
	nmap(ctrl('q'),'q!')
	nmap(ctrl('x'),"redo")
	nmap(ctrl('z'),"u")
	nmap(ctrl('['),'BufferLineCyclePrev')
	nmap(ctrl(']'),'BufferLineCycleNext')

	nmap(leader('p'),"PackerSync")
	nmap(leader('t'),"ToggleTerm")
end
return mapping
