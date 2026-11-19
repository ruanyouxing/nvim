return {
  'folke/snacks.nvim',
  priority = 1000,
  opts = {
    bufdelete = { enabled = true },
    terminal = {
      enabled = true,
      shell = 'nu',
      win = {
        position = 'bottom',
        height = 7,
        border = 'rounded',
        wo = {
          winbar = '',
          number = false,
          relativenumber = false,
        },
      },
      auto_close = true,
    },
    lazygit = {
      configure = true,
      win = {
        style = 'lazygit',
        border = 'rounded',
        position = 'float',
        height = 0.8,
        width = 0.8,
      },
    },
    notifier = {
      enabled = true,
      timeout = 1000,
      width = { min = 50, max = 0.4 },
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true,
      sort = { 'level', 'added' },
      style = 'compact',
      icons = {
        error = ' ',
        warn = ' ',
        info = ' ',
        debug = ' ',
        trace = '✎ ',
      },
    },
    picker = {
      enabled = true,
      ui_select = true,
      border = 'rounded',
      sources = {
        files = {
          hidden = true,
          exclude = { '.git/*', 'node_modules/*', '__pycache__/*' },
        },
        zoxide = {
          confirm = { 'cd', 'close' },
        },
      },
      layout = {
        preset = 'telescope',
        hidden = { 'preview' },
        layout = {
          width = 0.6,
          height = 0.8,
        },
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠆⠜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⠿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿
      ⣿⣿⡏⠁⠀⠀⠀⠀⠀⣀⣠⣤⣤⣶⣶⣶⣶⣶⣦⣤⡄⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿
      ⣿⣿⣷⣄⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡧⠇⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⣿⣿⣾⣮⣭⣿⡻⣽⣒⠀⣤⣜⣭⠐⢐⣒⠢⢰⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⣿⣿⣿⣏⣿⣿⣿⣿⣿⣿⡟⣾⣿⠂⢈⢿⣷⣞⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣷⣶⣾⡿⠿⣿⠗⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠻⠋⠉⠑⠀⠀⢘⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⣿⣿⣿⡿⠟⢹⣿⣿⡇⢀⣶⣶⠴⠶⠀⠀⢽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⣿⣿⣿⡿⠀⠀⢸⣿⣿⠀⠀⠣⠀⠀⠀⠀⠀⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
      ⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠹⣿⣧⣀⠀⠀⠀⠀⡀⣴⠁⢘⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿
      ⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⠗⠂⠄⠀⣴⡟⠀⠀⡃⠀⠉⠉⠟⡿⣿⣿⣿⣿
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠾⠛⠂⢹⠀⠀⠀⢡⠀⠀⠀⠀⠀⠙⠛⠿⢿
      ]],
        keys = {
          {
            icon = '󰈢 ',
            key = 'e',
            desc = 'Recent files',
            action = function()
              Snacks.picker.recent()
            end,
          },
          {
            icon = ' ',
            key = 'T',
            desc = 'Picker',
            action = function()
              Snacks.picker()
            end,
          },
          {
            icon = ' ',
            key = 'S',
            desc = 'List available sessions',
            action = function()
              vim.cmd [[Persisted select]]
            end,
          },
          {
            icon = ' ',
            key = '<leader>s',
            desc = 'Load latest saved session',
            action = function()
              require('persisted').load { last = true }
            end,
          },
          { icon = '󰗼 ', key = '<C-q>', desc = 'Exit Neovim', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        { title = 'Keys', icon = ' ', section = 'keys', padding = 2, indent = 3 },
        { section = 'startup' },
      },
    },
    indent = {
      enabled = true,
      indent = {
        hl = {
          'RainbowRed',
          'RainbowYellow',
          'RainbowBlue',
          'RainbowOrange',
          'RainbowGreen',
          'RainbowViolet',
          'RainbowCyan',
        },
      },
      scope = { enabled = true },
      filter = function(buf)
        local bo = vim.bo[buf]
        local exclude_filetypes = {
          ['log'] = true,
          ['fugitive'] = true,
          ['gitcommit'] = true,
          ['vimwiki'] = true,
          ['markdown'] = true,
          ['txt'] = true,
          ['vista'] = true,
          ['help'] = true,
          ['todoist'] = true,
          ['NvimTree'] = true,
          ['peekaboo'] = true,
          ['git'] = true,
          ['TelescopePrompt'] = true,
          ['undotree'] = true,
          ['flutterToolsOutline'] = true,
          ['lspinfo'] = true,
          ['neo-tree'] = true,
        }
        local exclude_buftypes = {
          ['terminal'] = true,
          ['nofile'] = true,
          ['quickfix'] = true,
          ['prompt'] = true,
        }
        if exclude_filetypes[bo.filetype] or exclude_buftypes[bo.buftype] then
          return false
        end
        return true
      end,
    },
  },
  keys = {
    {
      '<C-w>',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete buffer',
    },
    {
      'lg',
      function()
        Snacks.lazygit.open()
      end,
      desc = 'Open Lazygit',
    },
    {
      '<leader>t',
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Open toggle terminal',
    },
    {
      '<C-f>',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Live grep',
    },
    {
      '<C-S-f>',
      function()
        Snacks.picker.lines()
      end,
      desc = 'Find in file',
    },
    {
      '<C-S-p>',
      function()
        Snacks.picker()
      end,
      desc = 'Palette',
    },
    {
      '<C-t>',
      function()
        Snacks.picker.files()
      end,
      desc = 'Open files',
    },
    {
      '<leader>z',
      function()
        Snacks.picker.zoxide()
      end,
      desc = 'Jump to directory',
    },
  },
}
