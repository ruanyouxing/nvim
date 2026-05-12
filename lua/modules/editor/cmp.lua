--     local sources = {
--       { name = 'mocword' }, --dictionary
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
--     end
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
-- }
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
          require('luasnip.loaders.from_lua').load { paths = mnw.configDir .. '/snippets' }
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
      { 'erooke/blink-cmp-latex' },
      { 'moyiz/blink-emoji.nvim', ft = 'markdown' },
      { 'joelazar/blink-calc' },
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          libary = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          }
        }
      }
    },

    opts = {
      snippets = {
        preset = 'luasnip',
        expand = function(snippets)
          require('luasnip').lsp_expand(snippets)
        end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
        end,
        jump = function(direction)
          require('luasnip').jump(direction)
        end
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'latex', 'calc', 'lazydev' },
        per_filetype = {
          markdown = { inherit_defaults = true, 'render-markdown', 'emoji' },
        },
        providers = {
          buffer = {
            name = 'Buffer',
            opts = {
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr)
                  return vim.bo[bufnr].buftype == ''
                end, vim.api.nvim_list_bufs())
              end
            }
          },
          lsp = {
            name = 'LSP',
          },
          snippets = {
            name = 'Snippets',
          },
          path = {
            name = 'Path',
            opts = {
              show_hidden_files_by_default = true,
            }
          },
          latex = {
            name = 'Latex',
            module = 'blink-cmp-latex',
          },
          calc = {
            name = 'Calc',
            module = 'blink-calc',
          },
          ['render-markdown'] = {
            name = 'MD',
            module = 'render-markdown.integ.blink',
          },
          emoji = {
            name = 'Emoji',
            module = 'blink-emoji',
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
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
            columns = {
              { 'kind_icon' },
              { 'label',      'label_description', gap = 1 },
              { 'source_name' }
            },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbol_map[ctx.kind] or ""
                  end

                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
              source_name = {
                width = { max = 20 },
                text = function(ctx) return "[" .. ctx.source_name .. "]" end,
                highlight = 'BlinkCmpSource'
              },
            },
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
  },
  {
    'saghen/blink.pairs',
    opts = {
      mappings = {
        enabled = true,
        cmdline = true,
        disabled_filetypes = {},
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
  },
  {
    'saghen/blink.compat',
    version = '2.*',
    lazy = true,
    opts = {}
  }

}
