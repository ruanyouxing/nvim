local keymap = require 'core.keymap'
local nmap, imap, xmap, vmap = keymap.nmap, keymap.imap, keymap.xmap, keymap.vmap
local silent = keymap.silent
local opts = keymap.new_opts
local cmd, cu = keymap.cmd, keymap.cu
local plug = keymap.plug
vim.g.mapleader = ' '
nmap { ' ', '' }
xmap { ' ', '' }
nmap {
  { 'Y', 'y$' },
  { '<C-a>', 'ggVG' },
  { '<C-h>', '<C-w>h' },
  { '<C-l>', '<C-w>l' },
  { '<C-j>', '<C-w>j' },
  { '<C-k>', '<C-w>k' },
  { 'T', cmd 'TroubleToggle' },
  { 'U', cmd 'UndotreeShow' },
  { '<C-n>', cmd 'NvimTreeToggle' },
  { '<C-s>', cmd 'SymbolsOutline' },
  { '<leader>p', cmd 'Lazy sync' },
  { '<C-q>', cmd 'q!' },
  { '<C-S-p>', cmd 'Telescope' },
  { '<C-t>', cmd 'Telescope find_files' },
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
      vim.lsp.buf.format()
    end,
  },
  { '<leader>t', cmd 'ToggleTerm' },
  {
    '<leader>z',
    function()
      vim.cmd 'Telescope zoxide list'
      vim.cmd 'NvimTreeRefresh'
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
    '<F9>',
    function()
      if vim.o.conceallevel > 0 then
        vim.o.conceallevel = 0
      else
        vim.o.conceallevel = 2
      end
    end,
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
  },
}
nmap {
  { 'j', plug 'faster_move_j', opts(silent) },
  { 'k', plug 'faster_move_k', opts(silent) },
  { 'j', plug 'faster_move_gj', opts(silent) },
  { 'k', plug 'faster_move_gk', opts(silent) },
}
vmap { { 'j', plug 'faster_vmove_j' }, { 'k', plug 'faster_vmove_k' } }
imap {
  { '<C-c>', cmd 'PickColorInsert' },
  { '<C-i>', cmd 'IconPickerInsert alt_font symbols nerd_font emoji' },
}

for i = 1, 9 do
  vmap { ('<F%s>'):format(i), (cu(cmd 'HSHighlight %s<CR>'):format(i)) }
end
vmap { 'dh', 'HSRmHighlight' }
