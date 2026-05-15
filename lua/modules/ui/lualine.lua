_G.SessionStatus = _G.SessionStatus or ""

local function better_escape()
  if package.loaded['better_escape'] then
    return require('better_escape').waiting and '✺' or ''
  end
  return ''
end

local function lsp_name()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then return '' end

  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end

  if #names == 0 then return '' end

  return '  ' .. table.concat(names, ', ')
end

local function os_name()
  if os.getenv('WSL_DISTRO_NAME') ~= nil then
    return ''
  elseif vim.fn.has('macunix') == 1 then
    return ''
  else
    return '  NixOS'
  end
end

local function hbac_status()
  if package.loaded['hbac.state'] then
    if require('hbac.state').is_pinned(vim.api.nvim_get_current_buf()) then
      return ' Pinned'
    end
  end
  return ''
end
local function lazy_updates()
  if package.loaded['lazy.status'] then
    local lazy_status = require('lazy.status')
    if lazy_status.has_updates() then
      return lazy_status.updates()
    end
  end
  return ''
end

local function custom_filename()
  if package.loaded['hydra.statusline'] then
    local hydra = require('hydra.statusline')
    if hydra.is_active() then
      return '(' .. hydra.get_color() .. ') ' .. hydra.get_name()
    end
  end
  if vim.bo.filetype == 'CompetiTest' and not vim.fn.pumvisible() then
    local ok, title = pcall(vim.api.nvim_buf_get_var, 0, 'competitest_title')
    if ok then return title end
  end
  return ''
end

local function wpm_graph()
  if package.loaded['wpm'] then
    local w = require('wpm')
    return (w.wpm() or 0) .. ' | ' .. (w.historic_graph() or '')
  end
  return ''
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = function()
      local function get_hl_hex(name, attr, fallback)
        local color = vim.api.nvim_get_hl(0, { name = name })[attr]
        return color and string.format('#%06x', color) or fallback
      end

      local colors = {
        bg         = get_hl_hex('StatusLine', 'bg', '#22252A'),
        fg         = get_hl_hex('StatusLine', 'fg', '#C5CDD9'),
        teal       = '#5e9db2',
        red        = '#ec5767',
        yellow     = '#ecbe7b',
        blue       = '#51afef',
        orange     = '#ff8800',
        orange_alt = '#ff9e64',
        green      = '#98be65',
        purple     = '#a020f0',
      }

      local function nvim_mode_colors()
        local mode = vim.fn.mode()
        local mode_colors = {
          n       = colors.green,
          i       = colors.blue,
          v       = colors.yellow,
          V       = colors.yellow,
          ['\22'] = colors.yellow,
          c       = colors.purple,
          R       = colors.red,
          t       = colors.red,
        }
        return {
          fg = mode_colors[mode] or colors.fg,
          gui = 'bold'
        }
      end

      return {
        options = {
          theme = {
            normal = {
              a = { bg = 'NONE' },
              b = { bg = 'NONE' },
              c = { bg = 'NONE' },
              x = { bg = 'NONE' },
              y = { bg = 'NONE' },
              z = { bg = 'NONE' }
            }
          },
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
          disabled_filetypes = {
            statusline = {
              'dashboard',
              'TelescopePrompt'
            }
          }
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                local mode_names = {
                  NORMAL = 'Norm',
                  INSERT = 'Ins',
                  VISUAL = 'Visl',
                  ['V-LINE'] = 'VLine',
                  ['V-BLOCK'] = 'VBlck',
                  REPLACE = 'Rplc',
                  COMMAND = 'Com',
                  TERMINAL = 'Shell',
                }
                return mode_names[str] or str
              end,
              color = nvim_mode_colors -- Tính toán động
            },
            { better_escape, color = nvim_mode_colors },
          },
          lualine_b = {
            { 'branch', icon = '', color = { fg = colors.orange, gui = 'bold', } },
            { lsp_name, color = { fg = colors.red, gui = 'bold' } },
            { os_name, color = { fg = colors.blue } },
            { hbac_status, color = { fg = colors.red } },
            { function() return _G.SessionStatus or "" end, color = { fg = colors.green } },
            { lazy_updates, color = { fg = colors.orange_alt } },
          },
          lualine_c = {
            { function() return "%=" end },
            { custom_filename,           color = { fg = colors.blue, gui = 'bold' } },
            {
              'filename',
              file_status = true,
              path = 0,
              symbols = { unnamed = '', readonly = '', modified = '' },
              color = { fg = colors.green, gui = 'bold' },
              cond = function()
                if package.loaded['hydra.statusline'] and require('hydra.statusline').is_active() then return false end
                if vim.bo.filetype == 'CompetiTest' then return false end
                return true
              end,
            }
          },
          lualine_x = {
            { 'filesize', icon = '󰉉', color = { fg = colors.blue, gui = 'bold' } },
            { wpm_graph, color = { fg = colors.teal, gui = 'bold' } },
          },
          lualine_y = {
            {
              'diff',
              symbols = { added = ' ', modified = ' ', removed = ' ' },
              diff_color = {
                added = { fg = colors.green }, modified = { fg = colors.purple }, removed = { fg = colors.orange },
              },
            },
          },
          lualine_z = {
            { 'location', color = { fg = colors.orange, gui = 'bold' } },
            { 'progress', color = { fg = colors.blue, gui = 'bold' } },
          }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        extensions = { 'nvim-tree', 'quickfix', 'lazy' }
      }
    end,
  },
  {
    'jcdickinson/wpm.nvim',
    event = 'InsertEnter',
    opts = {
      sample_interval = 1000
    },
  }
}
