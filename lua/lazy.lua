require('packer_compiled')
local load = require('packer').loader
local fn = vim.fn
local fsize = fn.getfsize(vim.fn.expand("%:p:f"))
local load_ts = true
local load_lsp = true
if fsize > 1024^2 then
	load_ts = false
	load_lsp = false
end
if load_ts then
	load('nvim-treesitter')
	load('indent-blankline.nvim')
end
if load_lsp then
	load('nvim-lspconfig')
	load('lsp_signature.nvim')
	load('trouble.nvim')
	load('aerial.nvim')
end
load('plenary.nvim')
if packer_plugins['plenary.nvim'].loaded then
	load('telescope.nvim')
	load('fd')
	load('ripgrep')
	load('telescope-zoxide')
end
load('nvim-tree.lua')
local function is_gitrepo()
	local is_repo = fn.system('git rev-parse --is-inside-work-tree')
	if vim.v.shell_error == 0 then
		return true
	end
	return false
end

if is_gitrepo() == true then
	load('gitsigns.nvim')
	load('diffview.nvim')
end
local filetype = vim.bo.filetype
if filetype == 'markdown' then
	load('vimwiki')
end
