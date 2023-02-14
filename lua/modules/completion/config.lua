local completion = {}
function completion.autopairs()
  require('nvim-autopairs').setup {
    check_ts = true,
  }
  local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  local cmp = require 'cmp'
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
end

function completion.cmp()
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'
  local mapping = cmp.mapping
  local function highlight(name, guifg, guibg)
    return (name .. ' ' .. guifg .. ' ' .. guibg)
  end

  highlight('CmpItemKindSnippet', 'guifg=#BF616A', 'guibg=NONE')
  highlight('CmpItemKindUnit', 'guifg=#D08770', 'guibg=NONE')
  highlight('CmpItemKindProperty', 'guifg=#A3BE8C', 'guibg=NONE')
  highlight('CmpItemKindKeyword', 'guifg=#EBCB8B', 'guibg=NONE')
  highlight('CmpItemAbbrMatch', 'guifg=#5E81AC', 'guibg=NONE')
  highlight('CmpItemAbbrMatchFuzzy', 'guifg=#5E81AC', 'guibg=NONE')
  highlight('CmpItemKindVariable', 'guifg=#8FBCBB', 'guibg=NONE')
  highlight('CmpItemKindInterface', 'guifg=#88C0D0', 'guibg=NONE')
  highlight('CmpItemKindText', 'guifg=#81A1C1', 'guibg=NONE')
  highlight('CmpItemKindFunction', 'guifg=#B48EAD', 'guibg=NONE')
  highlight('CmpItemKindMethod', 'guifg=#B48EAD', 'guibg=NONE')

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local has_words_before = function()
    local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
  end

  local sources = {
    { name = 'nvim_lsp' },
    { name = 'calc' },
    { name = 'latex_symbols' },
    { name = 'treesitter' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'emoji' },
    {
      keyword_length = 2,
      option = {
        convert_case = true,
        loud = true,
      },
    },
  }
  if vim.o.ft == 'markdown' then
    table.insert(sources, { name = 'spell' })
    table.insert(sources, { name = 'look' })
  end
  if vim.o.ft == 'lua' then
    table.insert(sources, { name = 'nvim_lua' })
  end
  cmp.setup {
    formatting = {
      format = function(entry, vim_item)
        local icons = {
          Text = '',
          Method = '',
          Function = '',
          Constructor = '',
          Field = '',
          Variable = '',
          Class = 'ﴯ',
          Interface = '',
          Module = '',
          Property = 'ﰠ',
          Unit = '',
          Value = '',
          Enum = '',
          Keyword = '',
          Snippet = '',
          Color = '',
          File = '',
          Reference = '',
          Folder = '',
          EnumMember = '',
          Constant = '',
          Struct = '',
          Event = '',
          Operator = '',
          TypeParameter = '',
        }
        vim_item.kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)

        vim_item.menu = ({
              buffer = '[Buf]',
              nvim_lsp = '[LSP]',
              nvim_lua = '[Lua]',
              path = '[Path]',
              luasnip = '[Snip]',
              spell = '[Spell]',
            })[entry.source.name]

        return vim_item
      end,
    },
    mapping = {
      ['<CR>'] = mapping.confirm { select = true },
      ['<S-Space>'] = mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable( -1) then
          vim.fn.feedkeys(t '<Plug>luasnip-jump-prev', '')
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    sorting = {},
    sources = sources,
  }
end

function completion.snippets()
  local ls = require 'luasnip'
  ls.config.set_config {
    history = true,
    enable_autosnippets = true,
    update_events = 'TextChanged,TextChangedI',
    store_selection_keys = true,
  }
  require('luasnip/loaders/from_vscode').load()
  require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets/' }
end

return completion
