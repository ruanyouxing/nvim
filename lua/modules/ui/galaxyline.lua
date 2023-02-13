local config = {}

function config.setup()
  vim.opt.laststatus = 3
  local hydra = require 'hydra.statusline'
  local gl = require 'galaxyline'
  local colors = {
    fg = '#bbc2cf',
    red = '#ec5767',
    yellow = '#ecbe7b',
    blue = '#51afef',
    orange = '#ff8800',
    green = '#98be65',
  }
  local gls = gl.section
  local cond = require 'galaxyline.condition'
  local function get_color(group, attr)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
  end
  colors.bg = get_color('StatusLine', 'bg')
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
      condition = cond.check_git_workspace,
      icon = ' ',
      highlight = { colors.orange, colors.bg },
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.left[4] = {
    Lsp = {
      provider = 'GetLspClient',
      condition = function()
        local tbl = {
          ['dashboard'] = true,
          ['help'] = true,
          ['NvimTree'] = true,
          ['Outline'] = true,
          ['lazy'] = true,
          ['TelescopePrompt'] = true,
          ['Trouble'] = true,
          ['undotree'] = true,
          [''] = true,
        }
        if tbl[vim.bo.filetype] then
          return false
        else
          return true
        end
      end,
      icon = ' ',
      highlight = { colors.red, colors.bg, 'bold' },
      separator = '  ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.left[5] = {
    LazyUpdates = {
      provider = require('lazy.status').updates,
      condition = require('lazy.status').has_updates,
      highlight = {"#ff9e64",colors.bg}
    }
  }
  gls.mid[1] = {
    Hydra = {
      provider = function()
        return hydra.get_name()
      end,
      condition = function()
        return hydra.is_active()
      end,
      highlight = { colors.green, colors.bg },
    },
  }
  gls.mid[2] = {
    BufferIcon = {
      provider = 'FileIcon',
      highlight = { colors.green, colors.bg },
      condition = cond.buffer_not_empty,
      separator = ' ',
      separator_highlight = { 'NONE', colors.bg },
    },
  }
  gls.mid[3] = {
    FileName = {
      provider = 'FileName',
      confition = function()
        if vim.bo.filetype == 'NvimTree' then
          return false
        else
          return true
        end
      end,
      highlight = { colors.green, colors.bg, 'bold' },
      condition = cond.buffer_not_empty,
    },
  }
  gls.right[1] = {
    FileSize = {
      provider = 'FileSize',
      condition = function()
        if vim.fn.empty(vim.fn.expand '%:t') ~= 1 then
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
      condition = cond.check_git_workspace,
      icon = '  ',
    },
  }
  gls.right[3] = {
    Modified = {
      provider = 'DiffModified',
      highlight = { '#a020f0', colors.bg },
      condition = cond.check_git_workspace,
      icon = ' 柳 ',
    },
  }
  gls.right[4] = {
    Removed = {
      provider = 'DiffRemove',
      highlight = { colors.red, colors.bg },
      condition = cond.check_git_workspace,
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

return config
