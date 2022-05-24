local split = vim.split
local fn = vim.fn
local loop = vim.loop
local glob = fn.glob
local conf_dir = fn.stdpath('config')
local homepath = os.getenv("HOME")

require('pack')
local luafiles = split(glob(conf_dir..'/lua/*.lua'),'\n')
	for i in ipairs(luafiles) do
		local files = string.sub(luafiles[i],#homepath+19,-5)
		if files == 'plugins' or files == 'pack' then
			i = i + 1
		end
		require(files)
		if files == 'mapping' then
			require(files).shortcuts()
			require(files).commands()
			require(files).func()
		end
	end
