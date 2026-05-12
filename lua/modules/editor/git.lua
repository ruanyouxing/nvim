local is_gitrepo = function()
  local is_repo = vim.fn.system 'git rev-parse --is-inside-work-tree'
  if vim.v.shell_error == 0 then
    return true
  end
  return false
end
local git_plugins = { {
  'sindrets/diffview.nvim',
  config = function()
    local cb = require('diffview.config').diffview_callback
    require('diffview').setup {
      diff_binaries = false,
      enhanced_diff_hl = false,
      use_icons = true,
      icons = {
        folder_closed = '',
        folder_open = '',
      },
      signs = {
        fold_closed = '',
        fold_open = '',
      },
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {},
      key_bindings = {
        disable_defaults = false,
        view = {
          ['<tab>'] = cb 'select_next_entry',
          ['<s-tab>'] = cb 'select_prev_entry',
          ['gf'] = cb 'goto_file',
          ['<C-w><C-f>'] = cb 'goto_file_split',
          ['<C-w>gf'] = cb 'goto_file_tab',
          ['<leader>e'] = cb 'focus_files',
          ['<leader>b'] = cb 'toggle_files',
        },
        file_history_panel = {
          ['g!'] = cb 'options',
          ['<C-A-d>'] = cb 'open_in_diffview',
          ['y'] = cb 'copy_hash',
          ['zR'] = cb 'open_all_folds',
          ['zM'] = cb 'close_all_folds',
          ['j'] = cb 'next_entry',
          ['<down>'] = cb 'next_entry',
          ['k'] = cb 'prev_entry',
          ['<up>'] = cb 'prev_entry',
          ['<cr>'] = cb 'select_entry',
          ['o'] = cb 'select_entry',
          ['<2-LeftMouse>'] = cb 'select_entry',
          ['<tab>'] = cb 'select_next_entry',
          ['<s-tab>'] = cb 'select_prev_entry',
          ['gf'] = cb 'goto_file',
          ['<C-w><C-f>'] = cb 'goto_file_split',
          ['<C-w>gf'] = cb 'goto_file_tab',
          ['<leader>e'] = cb 'focus_files',
          ['<leader>b'] = cb 'toggle_files',
        },
        option_panel = {
          ['<tab>'] = cb 'select',
          ['q'] = cb 'close',
        },
      },
    }
  end,
  cond = is_gitrepo,
  cmd = 'DiffviewOpen',
}
, {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      signs = {
        add = { text = '▌' },
        change = { text = '▌' },
        delete = { text = '▌' },
        topdelete = { text = '▌' },
        changedelete = { text = '▌' },
      },
      preview_config = { border = 'rounded' },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 100,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y:%m-%d>, <summary>',
    }
  end,
  cond = is_gitrepo,
  event = 'BufRead',
}
}
return git_plugins
