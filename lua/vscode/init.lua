local vim_plugfile = vim.fn.filereadable(vim.fn.expand(vim.fn.stdpath 'data' .. '/site/autoload/plug.vim'))
local os_name = vim.loop.os_uname().sysname
if vim_plugfile == 0 and os_name == 'Windows_NT' then
  print 'Please install vim-plug by executing this command'
  local str = [[iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
  ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force]]
  print(str)
  return
elseif vim_plugfile == 0 and os_name == 'Linux' then
  print 'Please install vim-plug by executing this command'
  print [[ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim']]
  return
end
local Plug = vim.fn['plug#']
local plugin_dir = vim.fn.expand(vim.fn.stdpath 'data' .. '/plugs/')
vim.call('plug#begin', plugin_dir)
Plug('phaazon/hop.nvim', { branch = 'v2' })
Plug 'terrortylor/nvim-comment'
vim.call 'plug#end'
require('hop').setup {
  keys = 'etovxqpdygfblzhckisuran',
}
require('nvim_comment').setup {
  comment_empty = false,
  create_mappings = true,
  line_mapping = 'gcc',
  operator_mapping = 'gc',
}
local keymap = require 'core.keymap'
local nmap, xmap, vmap = keymap.nmap, keymap.xmap, keymap.vmap
nmap {
  {
    'H',
    function()
      require('hop').hint_words {
        direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
        current_line_only = true,
      }
    end,
  },
  {
    'L',
    function()
      require('hop').hint_words { direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }
    end,
  },
  {
    '<S-Space>',
    function()
      require('hop').hint_lines_skip_whitespace()
    end,
  },
}
vmap {
  { 'jk', '<ESC>' },
  { 'q',  '<ESC>' },
  {
    '<S-Space>',
    function()
      require('hop').hint_lines_skip_whitespace()
    end,
  },
  {
    'w',
    function()
      require('hop').hint_words { direction = require('hop.hint').HintDirection.AFTER_CURSOR }
    end,
  },
  {
    'W',
    function()
      require('hop').hint_words { direction = require('hop.hint').HintDirection.BEFORE_CURSOR }
    end,
  },
  {
    'H',
    function()
      require('hop').hint_words {
        direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
        current_line_only = true,
      }
    end,
  },
  {
    'L',
    function()
      require('hop').hint_words { direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }
    end,
  },
}

