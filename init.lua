local split = vim.split
local fn = vim.fn
local loop = vim.loop
local glob = fn.glob
local conf_dir = fn.stdpath('config')
local homepath = os.getenv("HOME")

	local data_dir = string.format("%s/site",fn.stdpath("data"))
	local packer_dir = data_dir .. "/pack/packer/opt/packer.nvim"
	local state = loop.fs_stat(packer_dir)
	if not state then
	local cmd = "!git clone https://github.com/wbthomason/packer.nvim " .. packer_dir
	vim.cmd(cmd)
	loop.fs_mkdir(data_dir .. "lua",511,
	function() assert("make compile path failed")end)
	end

	vim.cmd('packadd packer.nvim')
	local packer = require('packer')
	local util = require('packer.util')

	packer.init({
		profile = {enable = true,threshold = 1},
		auto_reload_compiled = true,
		display = {
		open_fn = function()
			return util.float({ border = 'single' })
		end,
	}})
	packer.startup({function(use)
		use {'wbthomason/packer.nvim',opt = true}
	end,
})
	local use = packer.use
	local repos = require('plugins')
	for i in ipairs(repos) do
		use(repos[i])
	end
local luafiles = split(glob(conf_dir..'/lua/*.lua'),'\n')
	for i in ipairs(luafiles) do
		local files = string.sub(luafiles[i],#homepath+19,-5)
		if files == 'plugins' then
			i = i + 1
		end
		require(files)
		if files == 'mapping' then
			require(files).shortcuts()
			require(files).commands()
			require(files).func()
		end
	end
