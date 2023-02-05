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
      ['<C-p>'] = mapping.select_prev_item(),
      ['<C-n>'] = mapping.select_next_item(),
      ['<S-Space>'] = mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
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
function completion.lsp_installer()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local completionItem = capabilities.textDocument.completion.completionItem
  completionItem.documentationFormat = {
    'markdown',
    'plaintext',
  }
  completionItem.snippetSupport = true
  completionItem.preselectSupport = true
  completionItem.insertReplaceSupport = true
  completionItem.labelDetailsSupport = true
  completionItem.deprecatedSupport = true
  completionItem.commitCharactersSupport = true
  completionItem.tagSupport = { valueSet = { 1 } }
  completionItem.resolveSupport = {
    properties = { 'documentation', 'detail', 'additionalTextEdits' },
  }
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  require('mason').setup()
  local lsp_installer = require 'mason-lspconfig'
  local servers = {
    'bashls',
    'cssls',
    'html',
    'pyright',
    'jsonls',
    'tsserver',
  }

  lsp_installer.setup {
    ensure_isntalled = { servers, 'sumneko_lua', 'clangd' },
    automatic_installation = true,
  }
  local on_attach = function(client, bufnr)
    require('nvim-navic').attach(client, bufnr)
  end
  local clangd_defaults = require 'lspconfig.server_configurations.clangd'
  local clangd_configs = vim.tbl_deep_extend('force', clangd_defaults['default_config'], {
    cmd = {
      'clangd',
      '--offset-encoding=utf-16',
      '-j=4',
      '--background-index',
      '--clang-tidy',
      '--fallback-style=llvm',
      '--all-scopes-completion',
      '--completion-style=detailed',
      '--header-insertion=iwyu',
      '--header-insertion-decorators',
      '--pch-storage=memory',
    },
  })

  local clangd = require 'clangd_extensions'
  clangd.setup {
    server = clangd_configs,
    extensions = {
      autoSetHints = true,
      hover_with_actions = true,
      inlay_hints = {
        only_current_line = false,
        only_current_line_autocmd = 'CursorHold',
        show_parameter_hints = true,
        parameter_hints_prefix = '<- ',
        other_hints_prefix = '=> ',
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = 'Comment',
        priority = 100,
      },
      ast = {
        role_icons = {
          type = '',
          declaration = '',
          expression = '',
          specifier = '',
          statement = '',
          ['template argument'] = '',
        },
        {
          Compound = '',
          Recovery = '',
          TranslationUnit = '',
          PackExpansion = '',
          TemplateTypeParm = '',
          TemplateTemplateParm = '',
          TemplateParamObject = '',
        },
        highlights = {
          detail = 'Comment',
        },
        memory_usage = {
          border = 'rounded',
        },
        symbol_info = {
          border = 'rounded',
        },
      },
    },
  }
  require('lspconfig').sumneko_lua.setup {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim', 'packer_plugins' } },
        workspace = {
          library = {
            [vim.fn.expand '$VIMRUNTIME/lua'] = true,
            [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
        telemetry = { enable = false },
      },
    },
  }
  for _, name in ipairs(servers) do
    require('lspconfig')[name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = { debounce_text_changes = 500 },
    }
  end
end

function completion.lsputils()
  local handlers = vim.lsp.handlers
  local symbols = require 'lsputil.symbols'
  local locations = require 'lsputil.locations'
  local code_action = require 'lsputil.codeAction'
  if vim.fn.has 'nvim-0.5.1' == 1 then
    handlers['textDocument/codeAction'] = code_action.code_action_handler
    handlers['textDocument/references'] = locations.references_handler
    handlers['textDocument/definition'] = locations.definition_handler
    handlers['textDocument/declaration'] = locations.declaration_handler
    handlers['textDocument/typeDefinition'] = locations.typeDefinition_handler
    handlers['textDocument/implementation'] = locations.implementation_handler
    handlers['textDocument/documentSymbol'] = symbols.document_handler
    handlers['workspace/symbol'] = symbols.workspace_handler
  else
    local bufnr = vim.api.nvim_buf_get_number(0)

    handlers['textDocument/codeAction'] = function(_, _, actions)
      code_action.code_action_handler(nil, actions, nil, nil, nil)
    end

    handlers['textDocument/references'] = function(_, _, result)
      locations.references_handler(nil, result, { bufnr = bufnr }, nil)
    end

    handlers['textDocument/definition'] = function(_, method, result)
      locations.definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlers['textDocument/declaration'] = function(_, method, result)
      locations.declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlers['textDocument/typeDefinition'] = function(_, method, result)
      locations.typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlers['textDocument/implementation'] = function(_, method, result)
      locations.implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
      symbols.document_handler(nil, result, { bufnr = bufn }, nil)
    end

    handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
      symbols.workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
  end
end

function completion.snippets()
  require('luasnip').config.set_config {
    history = true,
    update_events = 'TextChanged,TextChangedI',
    store_selection_keys = true,
  }
  require('luasnip/loaders/from_vscode').load()
end

function completion.trouble()
  require('trouble').setup {
    position = 'bottom',
    height = 6,
    width = 50,
    icons = true,
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
  }
end

return completion
