local g = vim.g
local set = vim.opt
set.linespace = 1
set.showcmd = true

set.termguicolors = true
set.title = true
set.foldmethod='manual'
set.list=true
set.wrapscan=true
set.swapfile=false
set.updatetime=97
set.signcolumn='yes'
set.number=true
set.smarttab=true
set.hidden=true
set.modifiable=true
set.autoindent=true
set.relativenumber=true
set.mouse='a'
set.incsearch=true
set.ignorecase=true
set.smartcase=true
set.hlsearch=true
set.cursorline=false
set.cursorcolumn=false
set.background='dark'
set.pumheight=11
set.encoding="utf-8"
set.fileencoding="utf-8"
vim.o.termguicolors = true

g.loaded_matchit = 1
g.matchup_surround_enabled = 1

g.smartindent=true
g.syntax_on=true
g.python_host_prog= '/usr/bin/python'
vim.cmd('colorscheme nord')
