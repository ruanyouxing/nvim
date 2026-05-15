local M = {}
M.compile_func = function()
  local Terminal = require('toggleterm.terminal').Terminal
  local termOpts = {
    cmd = nil,
    close_on_exit = false,
    dir = vim.fn.getcwd(),
    hidden = true,
    direction = 'tab',
  }
  if vim.bo.filetype == 'cpp' or vim.bo.filetype == 'c' then
    local compiler_name = ''
    if vim.bo.filetype == 'cpp' then
      compiler_name = 'g++ '
    else
      compiler_name = 'gcc '
    end
    vim.ui.input({ prompt = 'File name (press Ctrl-C to use default file output): ' }, function(input)
      if input == nil then
        input = vim.fn.expand('%:r' .. '.o')
      elseif input == 'q' then
        return
      end
      termOpts['cmd'] = compiler_name .. vim.fn.expand '%:p' .. ' -o ' .. input .. ' && ' .. './' .. input
      local compile = Terminal:new(termOpts)
      compile:toggle()
    end)
  elseif vim.bo.filetype == 'python' then
    termOpts['cmd'] = 'python ' .. vim.fn.expand '%:p'
    local compile = Terminal:new(termOpts)
    compile:toggle()
  end
end
function M.set_keymaps()
  local keymap = require 'core.keymap'
  local buf = vim.lsp.buf
  local nmap, imap, xmap, vmap = keymap.nmap, keymap.imap, keymap.xmap, keymap.vmap
  local silent = keymap.silent
  local opts = keymap.new_opts
  local cmd, cu = keymap.cmd, keymap.cu
  local plug = keymap.plug
  _G.OnFocus = 0
  nmap { ' ', '' }
  xmap { ' ', '' }
  -- which-key is now in misc.lua
  nmap {
    { 'Y',     'y$' },
    { '<C-a>', 'ggVG' },
    -- smart-splits is now in smart_splits.lua
    -- folds now in ufo.lua
    -- traiblazer now in bookmarks.lua
    {
      'T',
      function()
        vim.cmd [[Trouble diagnostics toggle]]
      end,
    },
    {
      '<leader>p',
      function()
        require('lazy').update()
      end,
    },
    { '<C-q>', cmd 'q!' },
    {
      '<C-S-p>',
      function()
        require('core.menu').trigger_menu()
      end,
    },
    -- <C-w> now moves to lua/modules/tools/snacks.lua
    { '<C-y>', cmd 'redo' },
    { '<C-z>', cmd 'u' },
    -- <leader>f now in lua/modules/editor/formatting.lua
    -- toggleterm is replaced by snacks.terminal.toggle()
    {
      '<leader>cp',
      function()
        require('keymap.config').compile_func()
      end,
    },
    -- lg moved to snacks.lua
    {
      '<leader>cc',
      function()
        if vim.o.conceallevel > 0 then
          vim.o.conceallevel = 0
        else
          vim.o.conceallevel = 2
        end
      end,
    },
    {
      'R',
      buf.rename,
    },
  }
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
  nmap {
    { 'j', plug 'faster_move_j',  opts(silent) },
    { 'k', plug 'faster_move_k',  opts(silent) },
    { 'j', plug 'faster_move_gj', opts(silent) },
    { 'k', plug 'faster_move_gk', opts(silent) },
  }
  vmap {
    { 'j', plug 'faster_vmove_j' },
    { 'k', plug 'faster_vmove_k' },
  }
  -- imap {
  --   { '<C-c>', cmd 'PickColorInsert' },
  --   { '<C-i>', cmd 'IconPickerInsert nerd_font_v3 alt_font symbols emoji' },
  -- }

  -- Cokeline
  nmap {
    { '<C-]>',   plug 'cokeline-focus-next' },
    { '<C-[>',   plug 'cokeline-focus-prev' },
    { '<Tab>',   plug 'cokeline-switch-next' },
    { '<S-Tab>', plug 'cokeline-switch-prev' },
  }
  for i = 1, 9 do
    nmap {
      { ('<C-%s>'):format(i),     (plug 'cokeline-focus-%s)'):format(i) },
      { ('<Leader>%s'):format(i), (plug 'cokeline-switch-%s)'):format(i) },
    }
  end
  for i = 1, 9 do
    vmap { ('<F%s>'):format(i), (cu(cmd 'HSHighlight %s<CR>'):format(i)) }
  end
  vmap { 'dh', 'HSRmHighlight' }

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
end

return M
