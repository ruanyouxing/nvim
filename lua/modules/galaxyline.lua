local galaxyline = {}
function galaxyline.statusline()
  vim.opt.laststatus = 3
  local navic = require('nvim-navic')
  local hydra = require('hydra.statusline')
  local gl = require('galaxyline')
  local colors = require('galaxyline.theme').default
  local gls = gl.section
  local condition = require('galaxyline.condition')
  colors.bg = string.sub(vim.api.nvim_command_output('hi StatusLine'), 59)
  gl.short_line_list = { 'NvimTree', 'Trouble', 'packer', 'TelescopePrompt', 'help' }
  gls.short_line_left[1] = {
    BufferType = {
      provider = 'FileTypeName',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },

      highlight = { colors.blue, colors.bg, 'bold' },
    },
  }
  gls.left[1] = {
    HalfLeftCircle = {
      provider = function()
        return ''
      end,

      highlight = { colors.bg, 'NONE' },
    },
  }
  gls.left[2] = {
    ViMode = {
      provider = function()
        local mode_color = {
          n = colors.green,
          i = colors.yellow,
          v = '#a020f0',
          V = '#a020f0',
          [''] = '#a020f0',
          c = colors.red,
          R = colors.red,
          Rv = colors.red,
          t = colors.blue,
          ['!'] = colors.blue,
        }
        local alias = {
          n = 'Norm',
          i = 'Ins',
          v = 'Visl',
          V = 'VLine',
          [''] = 'VBlck',
          c = 'Cmd',
          R = 'Rplc',
          Rv = 'Rplv',
          t = ' Term',
          ['!'] = ' Shell',
        }
        vim.cmd('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
        return alias[vim.fn.mode()]
      end,
      highlight = { colors.fg, colors.bg, 'bold' },
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.left[3] = {
    GitBranch = {
      provider = 'GitBranch',
      condition = condition.check_git_workspace,
      icon = ' ',
      highlight = { colors.orange, colors.bg },
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.left[4] = {
    Lsp = {
      provider = 'GetLspClient',
      icon = ' ',
      condition = function()
        local tbl = { ['alpha'] = true, ['toggleterm'] = true, ['NvimTree'] = true, [''] = true }
        if tbl[vim.bo.filetype] then
          return false
        end
        return true
      end,
      highlight = { colors.red, colors.bg, 'bold' },
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.left[5] = {
    nvimNavic = {
      provider = function()
        return navic.get_location()
      end,
      condition = function()
        return navic.is_available()
      end,
      highlight = { colors.blue, colors.bg, 'italic' },
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.mid[1] = {
    Hydra = {
      provider = function()
        return hydra.get_name()
      end,
      condition = function()
        return hydra.is_active()
      end,
      highlight = { colors.pink, colors.bg },
    },
  }
  gls.mid[2] = {
    BufferIcon = {
      provider = 'FileIcon',
      highlight = { colors.green, colors.bg },
      condition = condition.buffer_not_empty,
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.mid[3] = {
    FileName = {
      provider = 'FileName',
      highlight = { colors.green, colors.bg, 'bold' },
      condition = condition.buffer_not_empty,
    },
  }
  gls.right[1] = {
    FileSize = {
      provider = 'FileSize',
      condition = function()
        if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
          return true
        end
        return false
      end,
      icon = '   ',
      highlight = { colors.blue, colors.bg, 'bold' },
    },
  }
  gls.right[2] = {
    Added = {
      provider = 'DiffAdd',
      highlight = { colors.green, colors.bg },
      condition = condition.check_git_workspace,
      icon = '  ',
    },
  }
  gls.right[3] = {
    Modified = {
      provider = 'DiffModified',
      highlight = { '#a020f0', colors.bg },
      condition = condition.check_git_workspace,
      icon = ' 柳 ',
    },
  }
  gls.right[4] = {
    Removed = {
      provider = 'DiffRemove',
      highlight = { colors.red, colors.bg },
      condition = condition.check_git_workspace,
      icon = '  ',
    },
  }
  gls.right[5] = {
    LineInfo = {
      provider = 'LineColumn',
      highlight = { colors.orange, colors.bg },
    },
  }
  gls.right[6] = {
    HalfRightCircle = {
      provider = function()
        return ''
      end,
      highlight = { colors.bg, 'NONE' },
    },
  }
end

return galaxyline
