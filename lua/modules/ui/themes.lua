plugin {
  'Shatur/neovim-ayu',
  config = function()
    require('ayu').setup {
      mirage = true,
    }
  end,
  lazy = false,
  priority = 10000,
}
plugin {
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
    }
    vim.cmd 'colorscheme catppuccin'
  end,
}

plugin {
  'rebelot/kanagawa.nvim',
  config = function()
    require('kanagawa').setup {
      globalStatus = true,
      dimInactive = true,
    }
  end,
  lazy = false,
  priority = 10000,
}
plugin {
  'folke/tokyonight.nvim',
  config = function()
    vim.g.tokyonight_style = 'night'
    vim.g.tokyonight_hide_inactive_statusline = 1
    vim.g.tokyonight_italic_funtions = 1
    vim.g.tokyonight_italic_variables = 1
    vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
  end,
}

plugin {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      dark_variant = 'moon',
    }
  end,
}
