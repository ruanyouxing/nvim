vim.g.mapleader = ' '
require 'core.options'
require 'core.events'
require 'core.pack'
require('core.keymaps').set_keybinds()
vim.cmd.colorscheme 'catppuccin'
