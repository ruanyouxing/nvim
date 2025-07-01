plugin {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = true,
  cmd = 'Neotree',
  config = function()
    require('neo-tree').setup {
      sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
      enable_cursor_hijack = true,
      popup_border_style = '',
      open_files_using_relative_path = true,
      source_selector = {
        winbar = true,
        statusline = true,
        tabs_layout = 'active',
        separator = { left = '/', right = '\\', override = 'right' },
        show_separator_on_edge = true,
        highlight_separator = 'NeoTreeTabSeparatorInactive',
        highlight_separator_active = 'NeoTreeTabSeparatorActive',
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
        git_status = {
          symbols = {
            added = '',
            modified = '',
            renamed = '',
            untracked = '',
            deleted = '',
            ignored = '',
            unstaged = '',
            staged = '',
            conflict = '',
          },
        },
        name = {
          trailing_slash = true,
          use_git_status_colors = true,
          highlight = 'NeoTreeFileName',
        },
        symlink_target = {
          enabled = true,
        },
      },
      window = {
        width = '32',
        mappings = {
          ['P'] = {
            'toggle_preview',
            config = {
              use_float = false,
            },
          },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          visible = true,
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        use_libuv_file_watcher = true,
      },
    }
  end,
}
