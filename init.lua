local opts = require('aconfig.options')
local pack = require('aconfig.pack')
local events = require('aconfig.events')
local mapping = require('aconfig.mapping')


local function load_config()
local split = vim.split
local glob = vim.fn.glob
local homepath = os.getenv("HOME")
local config_dir = '~/.config/nvim/lua'

local paths = split(glob(config_dir..'/*/*lua'),'\n')
	for i in pairs(paths) do
		local files = paths[i].sub(paths[i],#homepath+19,-5)
		require(files)
	end
end

local load_core = function()
    vim.g.mapleader = " "
    pack.loads()
    mapping.config()
    load_config()
    opts.config()
    events.load_groups()
end

load_core()
