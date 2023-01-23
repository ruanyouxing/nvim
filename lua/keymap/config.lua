local keymap = require 'core.keymap'
local nmap, imap, xmap, vmap = keymap.nmap, keymap.imap, keymap.xmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd, cu = keymap.cmd, keymap.cu
local plug = keymap.plug
vim.g.mapleader = ' '
local defaults = opts(noremap, silent)
nmap { ' ', '', defaults }
xmap { ' ', '', defaults }
nmap {
  { 'Y', 'y$', defaults },
  { '<C-a>', 'ggVG', defaults },
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
  { '<C-S-p>', cmd 'Telescope', defaults },
  { '<C-t>', cmd 'Telescope find_files', defaults },
  {
    '<C-w>',
    function()
      require('bufdelete').bufdelete(0, true)
    end,
    defaults,
  },
  { '<C-y>', cmd 'redo', defaults },
  { '<C-z>', cmd 'u', defaults },
  {
    '<leader>f',
    function()
      vim.lsp.buf.format()
    end,
  },
  { '<leader>t', cmd 'ToggleTerm', defaults },
  { '<leader>z', cmd 'Telescope zoxide list', defaults },
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
}
nmap {
  { 'j', plug 'faster_move_j', opts(silent) },
  { 'k', plug 'faster_move_k', opts(silent) },
  { 'j', plug 'faster_move_gj', opts(silent) },
  { 'k', plug 'faster_move_gk', opts(silent) },
}
vmap { { 'j', plug 'faster_vmove_j', defaults }, { 'k', plug 'faster_vmove_k', defaults } }
imap {
  { '<C-c>', cmd 'PickColorInsert', defaults },
  { '<C-i>', cmd 'IconPickerInsert alt_font symbols nerd_font emoji', defaults },
}

for i = 1, 9 do
  vmap { ('<F%s>'):format(i), (cu(cmd 'HSHighlight %s<CR>'):format(i)), defaults }
end
vmap { 'dh', 'HSRmHighlight', defaults }
