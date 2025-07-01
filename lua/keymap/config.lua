local M = {}
local smart_splits = require 'smart-splits'
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
  vim.g.mapleader = ' '
  nmap { ' ', '' }
  xmap { ' ', '' }
  nmap {
    '<leader>?',
    function()
      require('which-key').show {}
    end,
  }
  nmap {
    { 'Y',     'y$' },
    { '<C-a>', 'ggVG' },
    {
      '<C-h>',
      function()
        smart_splits.move_cursor_left()
      end,
    },
    {
      '<C-l>',
      function()
        smart_splits.move_cursor_right()
      end,
    },
    {
      '<C-j>',
      function()
        smart_splits.move_cursor_up()
      end,
    },
    {
      '<C-k>',
      function()
        smart_splits.move_cursor_down()
      end,
    },
    {
      '<C-S-h>',
      function()
        smart_splits.resize_left()
      end,
    },
    {
      '<C-S-l>',
      function()
        smart_splits.resize_right()
      end,
    },
    {
      '<C-S-k>',
      function()
        smart_splits.resize_up()
      end,
    },
    {
      '<C-S-j>',
      function()
        smart_splits.resize_down()
      end,
    },
    {
      'mm',
      function()
        require('trailblazer').new_trail_mark()
      end,
    },
    {
      'F',
      function()
        if vim.fn.foldclosed '.' == -1 then
          vim.cmd [[foldclose]]
        else
          vim.cmd [[foldopen]]
        end
      end,
    },
    {
      'zM',
      function()
        require('ufo').closeAllFolds()
      end,
    },
    {
      'K',
      function()
        local winid = require('ufo').peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
    },
    {
      'zR',
      function()
        require('ufo').openAllFolds()
      end,
    },
    {
      'T',
      function()
        vim.cmd [[Trouble diagnostics toggle]]
      end,
    },
    { '<C-n>', cmd 'Neotree toggle' },
    {
      '<C-s>',
      function()
        require('codewindow').close_minimap()
        require('outline').toggle { focus_outline = false }
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
    {
      '<C-t>',
      function()
        require('telescope.builtin').find_files()
      end,
    },
    {
      '<C-w>',
      function()
        require('bufdelete').bufdelete(0, true)
      end,
    },
    { '<C-y>', cmd 'redo' },
    { '<C-z>', cmd 'u' },
    {
      '<leader>f',
      function()
        buf.format()
      end,
    },
    { '<leader>t', cmd 'ToggleTerm' },
    {
      '<leader>s',
      function()
        require('spectre').open()
      end,
    },
    {
      '<leader>z',
      function()
        require('telescope').extensions.zoxide.list {}
      end,
    },
    {
      '<leader>cp',
      function()
        require('keymap.config').compile_func()
      end,
    },
    {
      '<leader>mm',
      function()
        require('codewindow').toggle_minimap()
      end,
    },
    {
      '<leader>mf',
      function()
        require('codewindow').toggle_focus()
      end,
    },
    {
      'lg',
      function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new {
          cmd = 'lazygit',
          hidden = true,
          direction = 'float',
          float_opts = {
            border = 'double',
          },
        }
        lazygit:toggle()
      end,
    },
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
  imap {
    { '<C-c>', cmd 'PickColorInsert' },
    { '<C-i>', cmd 'IconPickerInsert nerd_font_v3 alt_font symbols emoji' },
  }

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
