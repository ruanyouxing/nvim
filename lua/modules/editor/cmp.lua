-- local cmp = { {
--   'hrsh7th/nvim-cmp',
--   config = function()
--     local cmp = require 'cmp'
--     local luasnip = require 'luasnip'
--     local mapping = cmp.mapping

--     local t = function(str)
--       return vim.api.nvim_replace_termcodes(str, true, true, true)
--     end

--     local has_words_before = function()
--       local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
--       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
--     end

--     local sources = {
--       { name = 'nvim_lsp' },
--       { name = 'calc' },
--       { name = 'latex_symbols' },
--       { name = 'treesitter' },
--       { name = 'luasnip' },
--       { name = 'path' },
--       { name = 'buffer' },
--       { name = 'emoji' },
--       { name = 'mocword' },
--       { name = 'render-markdown' },
--       { name = 'nvim_lsp_document_symbol' },
--       {
--         keyword_length = 2,
--         option = {
--           convert_case = true,
--           loud = true,
--         },
--       },
--     }
--     if vim.o.ft == 'markdown' then
--       table.insert(sources, { name = 'spell' })
--       table.insert(sources, { name = 'look' })
--     end
--     if vim.o.ft == 'lua' then
--       table.insert(sources, { name = 'nvim_lua' })
--     end
--     local lspkind = require 'lspkind'
--     cmp.setup {
--       enabled = function()
--         local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
--         if buftype == 'prompt' then
--           return false
--         end
--         return true
--       end,
--       view = {
--         entries = { name = 'custom', selection_order = 'near_cursor' },
--       },
--       window = {
--         completion = {
--           winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
--           col_offset = -3,
--           side_padding = 0,
--         },
--       },
--       formatting = {
--         fields = { 'kind', 'abbr', 'menu' },
--         format = function(entry, vim_item)
--           local kind = lspkind.cmp_format { mode = 'symbol_text', maxwidth = 50 } (entry, vim_item)
--           local strings = vim.split(kind.kind, '%s', { trimempty = true })
--           kind.kind = ' ' .. (strings[1] or '') .. ' '
--           kind.menu = '    [' .. (strings[2] or '') .. ']'

--           return kind
--         end,
--       },
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       sorting = {},
--       sources = sources,
--     }
--     cmp.setup.cmdline('/', {
--       mapping = cmp.mapping.preset.cmdline(),
--       sources = cmp.config.sources({
--         { name = 'nvim_lsp_document_symbol' },
--       }, {
--         { name = 'buffer' },
--       }),
--     })
--   end,
--   lazy = true,
-- }
-- , {
--   'L3MON4D3/LuaSnip',
--   event = 'InsertEnter',
--   config = function()
--     local ls = require 'luasnip'
--     ls.config.set_config {
--       history = true,
--       enable_autosnippets = true,
--       update_events = 'TextChanged,TextChangedI',
--       store_selection_keys = true,
--     }
--     require('luasnip/loaders/from_vscode').load()
--     require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets/' }
--   end,
-- }
-- , {
--   'TwIStOy/luasnip-snippets',
--   event = 'InsertEnter',
--   config = function()
--     require('luasnip-snippets').setup {
--       user = { name = 'hungz' },
--       snippet = { lua = { vim_snippet = true } },
--     }
--   end,
-- },
--   { 'hrsh7th/cmp-emoji',                    lazy = true },
--   { 'kdheepak/cmp-latex-symbols',           lazy = true },
--   { 'ray-x/cmp-treesitter',                 lazy = true },
--   { 'hrsh7th/cmp-buffer',                   lazy = true },
--   { 'hrsh7th/cmp-calc',                     lazy = true },
--   { 'saadparwaiz1/cmp_luasnip',             lazy = true },
--   { 'hrsh7th/cmp-nvim-lsp',                 lazy = true },
--   { 'hrsh7th/cmp-nvim-lua',                 lazy = true },
--   { 'octaltree/cmp-look',                   lazy = true },
--   { 'hrsh7th/cmp-path',                     lazy = true },
--   { 'f3fora/cmp-spell',                     lazy = true },
--   { 'yutkat/cmp-mocword',                   event = 'InsertEnter' },   -- requires mocword binary & mocword dataset
--   { 'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'CmdlineEnter', lazy = true },
-- }
-- return cmp
return {
  {
    'saghen/blink.cmp',
    lazy = false,
    -- version = 'v0.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        config = function()
          local ls = require 'luasnip'
          ls.config.set_config {
            history = true,
            enable_autosnippets = true,
            update_events = 'TextChanged,TextChangedI',
            store_selection_keys = true,
          }
          require('luasnip.loaders.from_vscode').load()
          require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets/' }
        end,
      },
      {
        'TwIStOy/luasnip-snippets',
        config = function()
          require('luasnip-snippets').setup {
            user = { name = 'hungz' },
            snippet = { lua = { vim_snippet = true } },
          }
        end,
      },
    },

    opts = {
      snippets = {
        preset = 'luasnip',
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lsp = { fallbacks = { 'buffer' } },
        },
      },
      keymap = {
        preset = 'none',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<S-Space>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
      },

      completion = {
        list = {
          selection = { preselect = true, auto_insert = false }
        },
        menu = {
          draw = {
            columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
          },
          border = 'none',
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
          scrollbar = false,

        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = 'none',
            scrollbar = false
          },
        },
      },

      signature = { enabled = true, window = { border = 'rounded' } },
    },

    config = function(_, opts)
      require('blink.cmp').setup(opts)
      local kind_colors = {
        { fg = '#EED8DA', bg = '#B5585F', kinds = { 'Field', 'Property', 'Event' } },
        { fg = '#C3E88D', bg = '#9FBD73', kinds = { 'Text', 'Enum', 'Keyword' } },
        { fg = '#FFE082', bg = '#D4BB6C', kinds = { 'Constant', 'Constructor', 'Reference' } },
        { fg = '#EADFF0', bg = '#A377BF', kinds = { 'Function', 'Struct', 'Class', 'Module', 'Operator' } },
        { fg = '#C5CDD9', bg = '#7E8294', kinds = { 'Variable', 'File' } },
        { fg = '#F5EBD9', bg = '#D4A959', kinds = { 'Unit', 'Snippet', 'Folder' } },
        { fg = '#DDE5F5', bg = '#6C8ED4', kinds = { 'Method', 'Value', 'EnumMember' } },
        { fg = '#D8EEEB', bg = '#58B5A8', kinds = { 'Interface', 'Color', 'TypeParameter' } },
      }

      for _, group in ipairs(kind_colors) do
        for _, kind in ipairs(group.kinds) do
          vim.api.nvim_set_hl(0, 'BlinkCmpKind' .. kind, { fg = group.fg, bg = group.bg })
        end
      end
    end,
  },
  {
    'saghen/blink.pairs',
    opts = {
      mappings = {
        enabled = true,
        cmdline = true,
        disabled_filetypes = {},
        -- wrap = {
        --   ['<C-b>'] = 'motion',
        --   ['<C-S-b>'] = 'motion_reverse',
        -- },
        pairs = {},
      },
      highlights = {
        enabled = true,
        cmdline = true,
        groups = { 'BlinkPairsOrange', 'BlinkPairsPurple', 'BlinkPairsBlue' },
        unmatched_group = 'BlinkPairsUnmatched',
        matchparen = {
          enabled = true,
          cmdline = false,
          include_surrounding = false,
          group = 'BlinkPairsMatchParen',
          priority = 250,
        },
      },
      debug = false,
    }
  }

}
