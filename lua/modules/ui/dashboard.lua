return {
  'glepnir/dashboard-nvim',
  config = function()
    local db = require 'dashboard'
    local version = vim.version()
    local plugins_count = require('lazy').stats().count

    local header = {
      desc = '',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠆⠜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⠿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿',
      '⣿⣿⡏⠁⠀⠀⠀⠀⠀⣀⣠⣤⣤⣶⣶⣶⣶⣶⣦⣤⡄⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿',
      '⣿⣿⣷⣄⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡧⠇⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣾⣮⣭⣿⡻⣽⣒⠀⣤⣜⣭⠐⢐⣒⠢⢰⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣏⣿⣿⣿⣿⣿⣿⡟⣾⣿⠂⢈⢿⣷⣞⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣷⣶⣾⡿⠿⣿⠗⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠻⠋⠉⠑⠀⠀⢘⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⣿⡿⠟⢹⣿⣿⡇⢀⣶⣶⠴⠶⠀⠀⢽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⣿⣿⣿⡿⠀⠀⢸⣿⣿⠀⠀⠣⠀⠀⠀⠀⠀⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠹⣿⣧⣀⠀⠀⠀⠀⡀⣴⠁⢘⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿',
      '⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⠗⠂⠄⠀⣴⡟⠀⠀⡃⠀⠉⠉⠟⡿⣿⣿⣿⣿',
      '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠾⠛⠂⢹⠀⠀⠀⢡⠀⠀⠀⠀⠀⠙⠛⠿⢿',
      '',
      '',
    }
    local footer = {
      ' ',
      ' Today is' .. os.date ' %d-%m-%Y 📆',
      tostring(plugins_count) .. ' plugins installed',
      'Version: ' .. version.major .. '.' .. version.minor .. '.' .. version.patch,
      '',
    }

    db.setup {
      theme = 'doom',
      config = {
        header = header,
        center = {
          {
            desc = '  Open files ',
            desc_hl = '@variable',
            group = 'Label',
            action = 'Telescope find_files',
            key = '<C-o>',
          },
          {
            desc = '  Create a new file ',
            desc_hl = '@variable',
            group = 'Label',
            action = function()
              vim.ui.input({ prompt = 'File name:' }, function(input)
                if input == nil then
                  return
                end
                vim.cmd('e ' .. input)
              end)
            end,
            key = '<C-S-n>',
          },
          {
            desc = '󰙅  Open file tree',
            desc_hl = '@variable',
            group = 'Label',
            key = '<C-n>',
            action = 'Neotree toggle',
          },
          {
            desc = '  Telescope',
            desc_hl = '@variable',
            group = 'Label',
            action = function()
              vim.cmd [[Telescope]]
            end,
            key = 'T',
          },
          {
            desc = '  List available sessions',
            desc_hl = '@variable',
            group = 'Label',
            key = 'S',
            action = function()
              vim.cmd [[Telescope persisted]]
            end,
          },
          {
            desc = '  Load latest saved session',
            desc_hl = '@variable',
            group = 'Label',
            key = '<leader>s',
            action = function()
              require('persisted').load { last = true }
            end,
          },
          {
            desc = '󰗼 Exit Neovim',
            desc_hl = '@variable',
            group = 'Label',
            key = '<C-q>',
            action = 'q!',
          },
        },
        footer = footer,
      },
    }
    vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#f7db32' })
  end,
}
