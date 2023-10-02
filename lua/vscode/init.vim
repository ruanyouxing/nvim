if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin()
Plug 'phaazon/hop.nvim'
Plug 'terrortylor/nvim-comment'
call plug#end()
lua << EOF
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
EOF
