---@module 'lazy'
---@module 'edgy'
---@type 'LazySpec'
return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    exit_when_last = true,
    options = {
      left = { size = 33 },
      -- bottom = { size = 30 }
      right = { size = 33 },
    },
    left = {
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        pinned = true,
        open = "Neotree show",
        size = { height = 0.6 },
      },
      {
        title = "Outline",
        ft = "Outline",
        pinned = true,
        open = function()
          require('outline').toggle { focus_outline = false }
        end,
        size = { height = 0.4 }
      },
      { title = "Undo Tree", ft = "undotree", pinned = false, open = "UndotreeToggle" },
    },

    bottom = {
      { title = "DAP Console", ft = "dapui_console" },
      { title = "DAP REPL",    ft = "dap-repl" },
      {
        title = "Terminal",
        ft = 'snacks_terminal',
        size = { height = 0.3 },
        filter = function(_, win)
          return vim.w[win].snacks_win and vim.w[win].snacks_win.position == pos and
              vim.w[win].snacks_win.relative == 'editor' and not vim.w[win].trouble_preview
        end,
      },
      {
        ft = "trouble",
        title = "Trouble.nvim",
        size = { height = 0.25 }
      },
      {
        ft = "help",
        size = { height = 20 },
        filter = function(buf) return vim.bo[buf].buftype == "help" end,
      },
    },

    right = {
      { title = "DAP Scopes",      ft = "dapui_scopes" },
      { title = "DAP Breakpoints", ft = "dapui_breakpoints" },
      { title = "DAP Stacks",      ft = "dapui_stacks" },
      { title = "DAP Watches",     ft = "dapui_watches" },
    },

    animate = {
      enabled = true,
    },

    keys = {
      ["<C-q>"] = function(win)
        win:close()
      end,
      ["Q"] = function(win)
        win:hide()
      end
    }
  }
}
