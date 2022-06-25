package.path = vim.fn.stdpath('config')..'/plugin/?.lua;'..package.path
local mapping = require('mapping')
require('options')
mapping.shortcuts()
mapping.commands()
mapping.func()
require('pack')
require('lazy')
require('events')
vim.cmd('colorscheme tokyonight')

