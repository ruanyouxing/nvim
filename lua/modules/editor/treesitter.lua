plugin { 'nvim-treesitter/nvim-treesitter-refactor', event = 'BufRead' }
plugin { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'BufRead' }
plugin { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufRead' }
plugin { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim', event = 'BufRead' }
plugin { 'windwp/nvim-ts-autotag', event = 'BufRead' }
plugin { 'nvim-treesitter/playground', dependencies = 'nvim-treesitter', cmd = 'TSPlaygroundToggle' }
plugin {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.install').compilers = { 'clang', 'gcc' }

    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'fish',
        'lua',
        'json',
        'yaml',
        'make',
        'norg',
        'python',
        'rust',
        'nix',
        'html',
        'javascript',
        'typescript',
        'query',
        'css',
        'qmljs',
      },
      sync_install = false,
      highlight = {
        enable = true,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
      autotag = {
        enable = true,
        filetypes = { 'html', 'xml' },
      },
      matchup = {
        enable = true,
      },
      refactor = {
        highlight_definitions = { enable = true, enable_autocmd = false },
        highlight_current_scope = { enable = true },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = 'grr',
          },
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        lsp_interop = {
          enable = true,
          border = 'none',
          peek_definition_code = {
            ['<leader>df'] = '@function.outer',
            ['<leader>dF'] = '@class.outer',
          },
        },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      },
    }
  end,
}
plugin {
  'romgrk/nvim-treesitter-context',
  event = 'BufRead',
  config = function()
    require('treesitter-context').setup {
      enable = true,
      throttle = true,
      max_lines = 0,
      patterns = {
        default = {
          'class',
          'function',
          'method',
          'for',
          'while',
          'if',
          'switch',
          'case',
        },
      },
      exact_patterns = {},
    }
  end,
}
