local config = {}

function config.cmp()
local function highlight(name,guifg,guibg)
	return (name..' '..guifg..' '..guibg)
end
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
	return col ~= 0 and vim.api.nvim_buf_get_lines(0,line-1,line,true)[1]:sub(col,col):match("%s") == nil
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
		    buffer = "[Buf]",
		    nvim_lsp = "[LSP]",
		    nvim_lua = "[Lua]",
		    path = "[Path]",
		    luasnip = "[Snip]",
		    spell = "[Spell]",
		    copilot = "[GC]",
		})[entry.source.name]

		return vim_item
	    end
	},
	-- You can set mappings if you want
	mapping = {
	    ["<CR>"] = cmp.mapping.confirm({select = true}),
	    ["<C-p>"] = cmp.mapping.select_prev_item(),
	    ["<C-n>"] = cmp.mapping.select_next_item(),
	    ["<C-e>"] = cmp.mapping.close(),
	    ["<S-Space>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	    end,{'i','s'}),
	    ["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	    end, {'i','s'}),
	    ["<A-h>"] = function(fallback)
		if require("luasnip").jumpable(-1) then
		    vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
		else
		    fallback()
		end
	    end,
	    ["<A-l>"] = function(fallback)
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
	sorting = {},
	sources = cmp.config.sources({
	    {name = "nvim_lsp"},
	    {name = "nvim_lua"},
	    {name = "luasnip"},
	    {name = "path"},
	    {name = "spell"},
	    {name = "buffer"},
	    {name = "copilot", group_index = 2},
	    {
		    keyword_length = 2,
		    option = {
			convert_case = true,
			loud = true
}}})}
end

function config.signature()
	require('lsp_signature').setup({
		bind = true,
		debug = false,
		log_path = vim.fn.stdpath('cache') .. "/lsp_signature.log",
		verbose = false,
		use_lspsaga = false,
		floating_window = true,
		floating_window_above_cur_line = true,
		fix_pos = false,
		hint_enable = true,
		hing_prefix = '🐼',
		hint_scheme = "String",
		hi_parameter = "LspSignatureActiveParameter",
		max_height = 12,
		max_width = 120,
		transparency = nil,
		doc_lines = 10,
		shadow_guibg = 'Black',
		timer_interval = '200',
		always_trigger = false,
		auto_close_after = nil,
		extra_trigger_chars = {},
		zindex = 200,
		padding = ' ',
		shadow_blend = 36,
		toggle_key = nil,
		hander_opts  = {
			border = "single",
		},

	})
	require'lsp_signature'.on_attach({
		bind = true,
		debug = false,
		log_path = vim.fn.stdpath('cache') .. "/lsp_signature.log",
		verbose = false,
		use_lspsaga = false,
		floating_window = true,
		floating_window_above_cur_line = true,
		fix_pos = false,
		hint_enable = true,
		hing_prefix = '🐼',
		hint_scheme = "String",
		hi_parameter = "LspSignatureActiveParameter",
		max_height = 12,
		max_width = 120,
		transparency = nil,
		doc_lines = 10,
		shadow_guibg = 'Black',
		timer_interval = '200',
		always_trigger = false,
		auto_close_after = nil,
		extra_trigger_chars = {},
		zindex = 200,
		padding = ' ',
		shadow_blend = 36,
		toggle_key = nil,
		hander_opts  = {
			border = "single",
		},
	},bufnr)
end

function config.snippets()
	require("luasnip").config.set_config({
		history = true,
		update_events = "TextChanged,TextChangedI",
		store_selection_keys = true,
	})
	require("luasnip/loaders/from_vscode").load()
end

function config.trouble()
	require('trouble').setup({
	    position = "bottom",
	    height = 6,
	    width = 50,
	    icons = true,
	    mode = "workspace_diagnostics",
	    fold_open = "",
	    fold_closed = "",
	    group = true,
	    padding = true,
	    action_keys = {
		close = "q",
		cancel = "<esc>",
		refresh = "r",
		jump = {"<cr>", "<tab>"},
		open_split = { "<c-x>" },
		open_vsplit = { "<c-v>" },
		open_tab = { "<c-t>" },
		jump_close = {"o"},
		toggle_mode = "m",
		toggle_preview = "P",
		hover = "K",
		preview = "p",
		close_folds = {"zM", "zm"},
		open_folds = {"zR", "zr"},
		toggle_fold = {"zA", "za"},
		previous = "k",
		next = "j"
	    },
	    indent_lines = true,
	    auto_open = false,
	    auto_close = false,
	    auto_preview = true,
	    auto_fold = false,
	    auto_jump = {"lsp_definitions"},
	    signs = {
		error = "",
		warning = "",
		hint = "",
		information = "",
		other = "﫠"
	    },
	    use_diagnostic_signs = true
	})
end

return config
