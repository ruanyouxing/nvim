---@diagnostic disable: unused-function
local M = {}
local function cmd(str)
  return '<cmd>' .. str .. '<CR>'
end

local function plug(str)
  return string.format('<Plug>(%s)', str)
end
M.plug = plug

local function cu(str)
  return '<C-u><cmd>' .. str .. '<CR>'
end

local function bind(mode)
  return function(mappings)
    for _, m in ipairs(mappings) do
      local lhs, rhs = m[1], m[2]
      local opts = { silent = true }

      for k, v in pairs(m) do
        if type(k) ~= "number" then
          opts[k] = v
        end
      end

      vim.keymap.set(mode, lhs, rhs, opts)
    end
  end
end

local nmap = bind('n')
local imap = bind('i')
local vmap = bind('v')
local xmap = bind('x')

function M.set_keybinds()
  local buf = vim.lsp.buf
  _G.OnFocus = 0

  nmap { { ' ', '' } }
  xmap { { ' ', '' } }

  nmap {
    { 'Y',         'y$',                                                 desc = "Yank to end of line" },
    { '<C-a>',     'ggVG',                                               desc = "Select all text" },
    { 'T',         function() vim.cmd('Trouble diagnostics toggle') end, desc = "Toggle Trouble Diagnostics" },
    { '<leader>p', function() require('lazy').update() end,              desc = "Update Lazy plugins" },
    { '<C-q>',     cmd('q!'),                                            desc = "Force quit" },
    { '<C-S-p>',   function() require('core.menu').trigger_menu() end,   desc = "Trigger Command Menu" },
    { '<C-y>',     cmd('redo'),                                          desc = "Redo action" },
    { '<C-z>',     cmd('u'),                                             desc = "Undo action" },
    {
      '<leader>cc',
      function() vim.o.conceallevel = vim.o.conceallevel > 0 and 0 or 2 end,
      desc = "Toggle conceal level"
    },
    { 'R',     buf.rename,                  desc = "LSP Rename variable" },

    { '<C-]>', plug('cokeline-focus-next'), desc = "Focus next tab" },
    { '<C-[>', plug('cokeline-focus-prev'), desc = "Focus previous tab" },
  }

  vmap {
    { '>', '>gv', desc = "Indent right and re-select" },
    { '<', '<gv', desc = "Indent left and re-select" },
  }

  -- imap {
  --   { '<C-c>', cmd('PickColorInsert'), desc = "Pick Color" },
  -- }
end

return M
