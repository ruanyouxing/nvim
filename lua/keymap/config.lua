local keymap = require 'core.keymap'
local nmap, imap, cmap, xmap, vmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd
local buf = vim.lsp.buf
vim.g.mapleader = ' '
local defaults = opts(noremap, silent)

_G.OnFocus = 0
local function load_autocmds()
  local autocmd = vim.api.nvim_create_autocmd
  vim.api.nvim_create_augroup('galaxyline', { clear = true })
  local options = {
    pattern = '*',
    group = 'galaxyline',
    callback = function()
      require('galaxyline').load_galaxyline()
    end,
  }
  local events = {
    'BufEnter',
    'BufReadPost',
    'BufWinEnter',
    'BufWritePost',
    'ColorScheme',
    'FileChangedShellPost',
    'FileType',
    'TermOpen',
    'VimResized',
    'WinEnter',
  }
  autocmd(events, options)
  autocmd({ 'WinLeave' }, {
    pattern = '*',
    group = 'galaxyline',
    callback = function()
      require('galaxyline').inactive_galaxyline()
    end,
  })
end

-- leaderkey
nmap { ' ', '', defaults }
xmap { ' ', '', defaults }

nmap {
  { 'Y', 'y$', defaults },
  {
    'K',
    function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end,
    defaults,
  },
  {
    'zR',
    function()
      require('ufo').openAllFolds()
    end,
    defaults,
  },
  {
    'zM',
    function()
      require('ufo').closeAllFolds()
    end,
  },
  { '<C-h>', '<C-w>h', defaults },
  { '<C-l>', '<C-w>l', defaults },
  { '<C-j>', '<C-w>j', defaults },
  { '<C-k>', '<C-w>k', defaults },
  { 'T', cmd 'TroubleToggle', defaults },
  { 'U', cmd 'UndotreeShow', defaults },
  { '<C-n>', cmd 'NvimTreeToggle', defaults },
  { '<C-s>', cmd 'SymbolsOutline', defaults },
  { '<leader>p', cmd 'PackerSync', defaults },
  { '<C-q>', cmd 'q!', defaults },
  { '<S-p>', 'Telescope', defaults },
  { '<C-t>', 'Telescope find_files', defaults },
  {
    '<C-w>',
    function()
      require('bufdelete').bufdelete(0, true)
    end,
    defaults,
  },
  { '<C-y>', 'redo', defaults },
  { '<C-z>', 'u', defaults },
  { '<leader>t', 'ToggleTerm', defaults },
  { '<leader>z', 'Telescope zoxide list', defaults },
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
    defaults,
  },
  {
    '<F9>',
    function()
      if vim.o.conceallevel > 0 then
        vim.o.conceallevel = 0
      else
        vim.o.conceallevel = 2
      end
    end,
    defaults,
  },
  {
    '<F10>',
    function()
      if vim.o.concealcursor == 'n' then
        vim.o.concealcursor = ''
      else
        vim.o.concealcursor = 'n'
      end
    end,
    defaults,
  },
  {
    '<F11>',
    function()
      if OnFocus == 0 then
        OnFocus = 1
        vim.api.nvim_del_augroup_by_name 'galaxyline'
        vim.o.statusline = 0
        vim.cmd [[TZAtaraxis]]
      else
        vim.cmd [[TZAtaraxis]]
        require('galaxyline').load_galaxyline()
        load_autocmds()
        OnFocus = 0
      end
    end,
    defaults,
  },
  {
    '<leader>ca',
    function()
      buf.code_action()
    end,
    defaults,
  },
  {
    '<C-i>',
    function()
      buf.references()
    end,
    defaults,
  },
  {
    'R',
    function()
      buf.rename()
    end,
    defaults,
  },
  { '<C-]>', '<Plug>(cokeline-focus-next)', defaults },
  { '<C-[>', '<Plug>(cokeline-focus-prev)', defaults },
  { '<Tab>', '<Plug>(cokeline-switch-next)', defaults },
  { '<S-Tab>', '<Plug>(cokeline-switch-prev)', defaults },
}
for i = 1, 9 do
  nmap {
    { ('<F%s>'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), defaults },
    { ('<Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), defaults },
  }
end

imap {
  { '<C-c>', cmd 'PickColorInsert', defaults },
  { '<C-i>', cmd 'IconPickerInsert alt_font symbols nerd_font emoji', defaults },
}

for i = 1, 9 do
  vmap { ('<F%s>'):format(i), ('<C-u>' .. cmd 'HSHighlight %s<CR>'):format(i), defaults }
end
vmap { 'dh', 'HSRmHighlight', defaults }
cmap { '<C-b>', '<Left>', defaults }
