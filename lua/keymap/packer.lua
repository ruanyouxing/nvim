local key = require 'core.keymap'
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd
local defaults = opts(noremap, silent)
nmap {
  { '<Leader>pu', cmd 'PackerUpdate', defaults },
  {
    '<Leader>ps',
    function()
      vim.cmd 'PackerSync'
      vim.cmd 'UpdateRemotePlugins'
    end,
    defaults,
  },
  { '<Leader>pi', cmd 'PackerInstall', defaults },
  { '<Leader>pc', cmd 'PackerCompile', defaults },
}
