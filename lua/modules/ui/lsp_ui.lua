return { {
  'hedyhli/outline.nvim',
  opts =
  {
    outline_window = {
      position = 'left',
      width = 27,
      show_cursorline = true,
      hide_cursor = true,
      auto_jump = true,
    },
    symbol_folding = {
      auto_unfold = { only = 2 },
    },
    symbols = {
      icons = {
        File = { icon = '󰈙 ', hl = '@text.uri' },
        Module = { icon = ' ', hl = '@namespace' },
        Namespace = { icon = '󰌗 ', hl = '@namespace' },
        Package = { icon = '󰏓 ', hl = '@namespace' },
        Class = { icon = '󰌗 ', hl = '@type' },
        Method = { icon = '󰆧 ', hl = '@method' },
        Property = { icon = '  ', hl = '@method' },
        Field = { icon = '󰮄 ', hl = '@field' },
        Constructor = { icon = ' ', hl = '@constructor' },
        Enum = { icon = '󰕘 ', hl = '@type' },
        Interface = { icon = '󰕘 ', hl = '@type' },
        Function = { icon = '󰊕 ', hl = '@function' },
        Variable = { icon = '󰀫 ', hl = '@constant' },
        Constant = { icon = '󰏿 ', hl = '@constant' },
        String = { icon = '󰀬 ', hl = '@string' },
        Number = { icon = '󰎠 ', hl = '@number' },
        Boolean = { icon = '◩ ', hl = '@boolean' },
        Array = { icon = '󰅪 ', hl = '@constant' },
        Object = { icon = '󰅩 ', hl = '@type' },
        Key = { icon = '󰌋 ', hl = '@type' },
        Null = { icon = '󰟢 ', hl = '@type' },
        EnumMember = { icon = ' ', hl = '@field' },
        Struct = { icon = ' ', hl = '@type' },
        Event = { icon = ' ', hl = '@type' },
        Operator = { icon = '󰆕 ', hl = '@operator' },
        TypeParameter = { icon = '󰊄 ', hl = '@parameter' },
        Component = { icon = '󰆼 ', hl = '@function' },
      },
    },
  },
  keys = {
    {
      '<C-s>',
      function()
        require('outline').toggle { focus_outline = false }
      end,
    },
  },
  cmd = 'Outline',
}

, {
  'utilyre/barbecue.nvim',
  config = function()
    vim.opt.updatetime = 200
    vim.api.nvim_create_autocmd({
      'BufWinEnter',
      'CursorHold',
      'InsertLeave',
      'BufWritePost',
      'TextChanged',
      'TextChangedI',
    }, {
      group = vim.api.nvim_create_augroup('barbecue.updater', {}),
      callback = function()
        require('barbecue.ui').update()
      end,
    })
    require('barbecue').setup {
      show_modified = true,
      create_autocmd = false,
    }
  end,
  dependencies = 'nvim-navic',
  event = 'BufRead',
}

, {
  'SmiteshP/nvim-navic',
  event = 'BufReadPre',
  opts = {
    icons = {
      File = '󰈙 ',
      Module = ' ',
      Namespace = '󰌗 ',
      Package = '󰏓 ',
      Class = '󰌗 ',
      Method = '󰆧 ',
      Property = ' ',
      Field = '󰮄 ',
      Constructor = ' ',
      Enum = '󰕘 ',
      Interface = '󰕘',
      Function = '󰊕 ',
      Variable = '󰀫 ',
      Constant = '󰏿 ',
      String = '󰀬 ',
      Number = '󰎠 ',
      Boolean = '◩ ',
      Array = '󰅪 ',
      Object = '󰅩 ',
      Key = '󰌋 ',
      Null = '󰟢 ',
      EnumMember = ' ',
      Struct = ' ',
      Event = ' ',
      Operator = '󰆕 ',
      TypeParameter = '󰊄 ',
    },
    highlight = false,
    separator = ' > ',
    depth_limit = 2,
    depth_limit_indicator = '..',
  },
  module = true,
}
, {
  'kosayoda/nvim-lightbulb',
  opts = {
    autocmd = {
      enabled = true,
    },
    sign = {
      enabled = true,
      priority = 10,
    },
    float = {
      enabled = false,
      text = '',
      win_opts = {},
    },
    virtual_text = {
      enabled = false,
      text = '💡',
      hl_mode = 'replace',
    },
    status_text = {
      enabled = false,
      text = '💡',
      text_unavailable = '',
    },
  },
  event = 'BufEnter',
}
, {
  'j-hui/fidget.nvim',
  opts = {},
  lazy = true,
}
, { 'onsails/lspkind.nvim', lazy = true }
-- , {
-- This shit has bugs
--   'gorbit99/codewindow.nvim',
--   opts = {
--       auto_enable = false,
--       exclude_filetypes = { 'NvimTree', 'UndoTree', 'Trouble', 'dashboard', 'tsplayground', 'Outline', 'spectre_panel' },
--       use_lsp = true,
--       use_treesitter = true,
--       use_git = true,
--       show_cursor = true,
--     },
--   event = 'BufRead',
--   keys = {
-- {
--   '<leader>mm',
--   function()
--     require('codewindow').toggle_minimap()
--   end,
-- },
-- {
--   '<leader>mf',
--   function()
--     require('codewindow').toggle_focus()
--   end,
-- },
--   }
-- }
, {
  'hasansujon786/nvim-navbuddy',
  opts = {
    lsp = {
      auto_attach = true
    }
  }
}
, {
  'folke/trouble.nvim',
  lazy = true,
  cmd = 'Trouble',
  opts = {
    position = 'bottom',
    height = 6,
    width = 50,
    mode = 'workspace_diagnostics',
    fold_open = '',
    fold_closed = '',
    group = true,
    padding = true,
    action_keys = {
      close = 'q',
      cancel = '<esc>',
      refresh = 'r',
      jump = { '<cr>', '<tab>' },
      open_split = { '<c-x>' },
      open_vsplit = { '<c-v>' },
      open_tab = { '<c-t>' },
      jump_close = { 'o' },
      toggle_mode = 'm',
      toggle_preview = 'P',
      hover = 'K',
      preview = 'p',
      close_folds = { 'zM', 'zm' },
      open_folds = { 'zR', 'zr' },
      toggle_fold = { 'zA', 'za' },
      previous = 'k',
      next = 'j',
    },
    indent_lines = true,
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    auto_jump = { 'lsp_definitions' },
    signs = {
      error = '',
      warning = '',
      hint = '',
      information = '',
      other = '﫠',
    },
    use_diagnostic_signs = true,
  },
} }
