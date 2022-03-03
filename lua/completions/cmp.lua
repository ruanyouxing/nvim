function highlight(name,guifg,guibg)
	return (name..' '..guifg..' '..guibg)
end
-- [[highlight( CmpItemAbbrDeprecated guifg=#D8DEE9 guibg=NONE gui=strikethrough]]
     highlight('CmpItemKindSnippet','guifg=#BF616A', 'guibg=NONE')
     highlight('CmpItemKindUnit','guifg=#D08770','guibg=NONE')
     highlight('CmpItemKindProperty','guifg=#A3BE8C','guibg=NONE')
     highlight('CmpItemKindKeyword','guifg=#EBCB8B','guibg=NONE')
     highlight('CmpItemAbbrMatch','guifg=#5E81AC', 'guibg=NONE')
     highlight('CmpItemAbbrMatchFuzzy','guifg=#5E81AC','guibg=NONE')
     highlight('CmpItemKindVariable', 'guifg=#8FBCBB', 'guibg=NONE')
     highlight('CmpItemKindInterface','guifg=#88C0D0', 'guibg=NONE')
     highlight('CmpItemKindText','guifg=#81A1C1','guibg=NONE')
     highlight('CmpItemKindFunction','guifg=#B48EAD', 'guibg=NONE')
     highlight('CmpItemKindMethod','guifg=#B48EAD','guibg=NONE')


    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and
                   vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                       col, col):match("%s") == nil
    end

    local cmp = require("cmp")
    cmp.setup {
        formatting = {
            format = function(entry, vim_item)
                local lspkind_icons = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = ""
                }
                -- load lspkind icons
                vim_item.kind = string.format("%s %s",
                                              lspkind_icons[vim_item.kind],
                                              vim_item.kind)

                vim_item.menu = ({
                    -- cmp_tabnine = "[TN]",
                    buffer = "[BUF]",
                    orgmode = "[ORG]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[LUA]",
                    path = "[PATH]",
                    tmux = "[TMUX]",
                    luasnip = "[SNIP]",
                    spell = "[SPELL]"
                })[entry.source.name]

                return vim_item
            end
        },
        -- You can set mappings if you want
        mapping = {
            ["<CR>"] = cmp.mapping.confirm({select = true}),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.close(),
            ["<C-h>"] = function(fallback)
                if require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                else
                    fallback()
                end
            end,
            ["<C-l>"] = function(fallback)
                if require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                else
                    fallback()
                end
            end
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        -- You should specify your *installed* sources.
        sources = {
            {name = "nvim_lsp"}, {name = "nvim_lua"}, {name = "luasnip"},
            {name = "path"}, {name = "spell"}, {name = "tmux"},
            {name = "orgmode"}, {name = "buffer"}
            -- {name = 'cmp_tabnine'}
        }
    }

   
     local tabnine = require('cmp_tabnine.config')
     tabnine:setup({max_line = 1000, max_num_results = 20, sort = true})


