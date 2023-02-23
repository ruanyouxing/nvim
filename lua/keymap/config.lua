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
    local outputFileName = vim.fn.input { prompt = 'File name: ', cancelreturn = vim.fn.expand '%:r' .. '.o' }
    termOpts['cmd'] = compiler_name
        .. vim.fn.expand '%:p'
        .. ' -o '
        .. outputFileName
        .. ' && '
        .. './'
        .. outputFileName
    local compile = Terminal:new(termOpts)
    compile:toggle()
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
    { 'Y',     'y$' },
    { '<C-a>', 'ggVG' },
    { '<C-h>', '<C-w>h' },
    { '<C-l>', '<C-w>l' },
    { '<C-j>', '<C-w>j' },
    { '<C-k>', '<C-w>k' },
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
        require('trouble').toggle()
      end,
    },
    { '<C-n>', cmd 'NvimTreeToggle' },
    {
      '<C-s>',
      function()
        require('codewindow').close_minimap()
        require('symbols-outline').toggle_outline()
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
      '<leader><leader>',
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
    { '<C-i>', cmd 'IconPickerInsert alt_font symbols nerd_font emoji' },
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
      { ('<F%s>'):format(i),      (plug 'cokeline-focus-%s)'):format(i) },
      { ('<Leader>%s'):format(i), (plug 'cokeline-switch-%s)'):format(i) },
    }
  end
  for i = 1, 9 do
    vmap { ('<F%s>'):format(i), (cu(cmd 'HSHighlight %s<CR>'):format(i)) }
  end
  vmap { 'dh', 'HSRmHighlight' }
  vim.keymap.set('n', '<CR>', function()
    vim.cmd 'NeoZoomToggle'
  end, { silent = true, nowait = true })

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
      'W',
      function()
        require('hop').hint_words()
      end,
    },
  }
end

return M
