-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend plugins key defines in this file

require 'keymap.config'
local key = require 'core.keymap'
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

nmap {
  { '<Leader>pu', cmd 'PackerUpdate', opts(noremap, silent) },
  { '<Leader>pi', cmd 'PackerInstall', opts(noremap, silent) },
  { '<Leader>pc', cmd 'PackerCompile', opts(noremap, silent) },
  { '<Leader>ss', cmd 'SessionSave', opts(noremap, silent) },
  { '<Leader>sl', cmd 'SessionLoad', opts(noremap, silent) },
  { '<Leader>b', cmd 'Telescope buffers', opts(noremap, silent) },
  { '<Leader>fa', cmd 'Telescope live_grep', opts(noremap, silent) },
}
