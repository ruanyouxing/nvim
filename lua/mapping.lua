local mapping = {}

local map = vim.api.nvim_set_keymap

local opts= {silent=true,noremap=true}

local function nmap(key,cmd) return map('n',key,cmd,opts) end
--local function imap(key,cmd) return map('i',key,cmd,opts) end

local function vmap(key,cmd) return map('v',key,cmd,opts) end
-- local function tmap(key,cmd) return map('t',key,cmd,opts) end
local function ctrl(key) return string.format('<C-%s>',key) end
local function alt(key) return string.format('<A-%s>',key) end
local function leader(key) return string.format('<leader>%s',key) end
local function cmd(command) return string.format(':%s<CR>',command) end
vim.opt.timeoutlen = 97


function mapping.config()
nmap('<Space>','<NOP>')
vim.g.mapleader =  " "
vmap("<leader>",'<NOP>')
nmap('lg',cmd('lua _lazygit_toggle()'))
nmap('U','UndoTreeToggle')
nmap(ctrl('a'),"ggVG")

--Window navigations
nmap(ctrl('b'),ctrl('w'))

nmap(ctrl('n'),cmd("NvimTreeToggle"))
nmap(ctrl(string.sub(alt('p'),4,-2)),cmd("Telescope"))
nmap(ctrl('r'),cmd("source %"))
nmap(ctrl('s'),cmd('AerialToggle'))
-- nmap(ctrl('s'),cmd("w!"))
nmap('T',cmd('TroubleToggle'))
nmap(ctrl('w'),cmd('q!'))
nmap(ctrl('x'),cmd("redo"))
nmap(ctrl('z'),"u")

nmap(leader('p'),cmd("PackerSync"))
nmap(leader('t'),cmd("ToggleTerm"))


--Buffers
nmap(ctrl('['),cmd('BufferLineCyclePrev'))
nmap(ctrl(']'),cmd('BufferLineCycleNext'))

local i = 1
for i = 2,9,i+1 do
	nmap(alt(tostring(i)),cmd('BufferLineGoToBuffer'.. tostring(i)))
end
end


return mapping
