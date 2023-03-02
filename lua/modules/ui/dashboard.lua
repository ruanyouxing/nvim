local db = require 'dashboard'
local version = vim.version()
local lockfile = table.concat({ vim.fn.stdpath 'data', 'lazy-lock.json' }, '/')
local function file_exists(file)
  local f = io.open(file, 'rb')
  if f then
    f:close()
  end
  return f ~= nil
end

local function lines_from(file)
  if not file_exists(file) then
    return {}
  end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local lines = 0
for _ in pairs(lines_from(lockfile)) do
  lines = lines + 1
end
local header = {
  desc = '',
  '',
  '',
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
  tostring(lines - 2) .. ' plugins installed',
  'Version: ' .. version.major .. '.' .. version.minor .. '.' .. version.patch,
  '',
}

db.setup {
  theme = 'doom',
  config = {
    header = header,
    center = {
      {
        desc = ' Open files ',
        desc_hl = '@variable',
        group = 'Label',
        action = 'Telescope find_files',
        key = '<C-o>',
      },
      {
        desc = ' Create a new file ',
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
        desc = 'פּ Open file tree',
        desc_hl = '@variable',
        group = 'Label',
        key = '<C-n>',
        action = 'NvimTreeToggle',
      },
      {
        desc = ' Telescope',
        desc_hl = '@variable',
        group = 'Label',
        action = function()
          vim.cmd [[Telescope]]
        end,
        key = 'T',
      },
      {
        desc = ' List available sessions',
        desc_hl = '@variable',
        group = 'Label',
        key = 'S',
        action = function()
          vim.cmd [[Telescope persisted]]
        end,
      },
      {
        desc = '祝Load latest saved session',
        desc_hl = '@variable',
        group = 'Label',
        key = '<leader>s',
        action = 'SessionLoadLast',
      },
      {
        desc = ' Exit Neovim',
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
