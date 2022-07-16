local galaxyline = {}
function galaxyline.statusline()
  vim.opt.laststatus = 3
  local navic = require('nvim-navic')
  local gl = require('galaxyline')
  local colors = require('galaxyline.theme').default
  local gls = gl.section
  local condition = require('galaxyline.condition')
  gl.short_line_list = { 'NvimTree', 'packer' }
  gls.short_line_left[1] = {
    BufferType = {
      provider = 'FileTypeName',
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
      highlight = { colors.blue, colors.bg, 'bold' },
    },
  }
  gls.left[1] = {
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
          n = '▊ Norm',
          i = '▊ Ins',
          v = '▊ Visl',
          V = '▊ VLine',
          [''] = '▊ VBlck',
          c = '▊ Cmd',
          R = '▊ Rplc',
          Rv = '▊ Rplv',
          t = '▊ Term',
          ['!'] = '▊ Shell',
        }
        vim.cmd('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
        return alias[vim.fn.mode()]
      end,
      highlight = { colors.fg, colors.bg, 'bold' },
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.left[2] = {
    GitBranch = {
      provider = 'GitBranch',
      condition = condition.check_git_workspace,
      icon = ' ',
      highlight = { colors.orange, colors.bg },
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.left[3] = {
    Lsp = {
      provider = 'GetLspClient',
      icon = ' ',
      condition = function()
        local tbl = { ['alpha'] = true, [''] = true, ['NvimTree'] = true }
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
  gls.left[4] = {
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
    BufferIcon = {
      provider = 'FileIcon',
      highlight = { colors.green, colors.bg },
      condition = condition.buffer_not_empty,
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.mid[2] = {
    FileName = {
      provider = 'FileName',
      highlight = { colors.green, colors.bg, 'bold' },
      condition = condition.buffer_not_empty,
    },
  }
  gls.right[1] = {
    FileIcon = {
      provider = function()
        return ' '
      end,
      highlight = { 'NONE', colors.bg },
    },
    FileSize = {
      provider = 'FileSize',
      condition = function()
        if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
          return true
        end
        return false
      end,
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
      icon = ' 柳',
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
    Whitespace = {
      provider = function()
        return ' '
      end,
      highlight = { 'NONE', colors.bg },
    },
  }
end

return galaxyline
