
local cfg = {
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
}

require('lsp_signature').setup(cfg)
require'lsp_signature'.on_attach(cfg, bufnr)
