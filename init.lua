local mapping = require('mapping')
local split = vim.split
local glob = vim.fn.glob
local homepath = os.getenv("HOME")

local pack = {}

function pack.load_plugin_list()
	local plugin_path = split(glob('~/.config/nvim/lua/plugins.lua'),'\n')
	local list = {}
	for i in ipairs(plugin_path) do
		list[i] = string.sub(plugin_path[i],#homepath+19,-5)
	end
	local use = require('packer').use
		local repos = {}
		for i in ipairs(list) do
			local tmp = require(list[i])
			for j in ipairs(tmp) do
				table.insert(repos,tmp[j])
			end
		end
	return use(repos)
end

function pack.config()
	local data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
	local packer_dir = data_dir .. "/pack/packer/opt/packer.nvim"
	local state = vim.loop.fs_stat(packer_dir)
	if not state then
	local cmd = "!git clone https://github.com/wbthomason/packer.nvim " .. packer_dir
	vim.cmd(cmd)
	vim.loop.fs_mkdir(data_dir .. "lua",511,
	function() assert("make compile path failed")end)
	end

	vim.cmd('packadd packer.nvim')
	require('packer').startup({function(use)
		use {'wbthomason/packer.nvim',opt = true}
	end,
	config = {
		display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
	end
	}
}})
end
    pack.config()
    pack.load_plugin_list()
    mapping.shortcuts()
    mapping.commands()
    require('options')
    require('events')
    require('editor')
    require('tools')
    require('completion')
    require('themes')
    require('lsp')



