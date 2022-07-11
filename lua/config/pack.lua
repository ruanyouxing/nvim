local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd('packadd packer.nvim')
end
local list = {}
local repos = require('plugins')
for repo, conf in pairs(repos) do
  list[#list + 1] = vim.tbl_extend('force', { repo }, conf)
end
return require('packer').startup({
  function(use)
    use({ 'wbthomason/packer.nvim' })
    for _, repo in ipairs(list) do
      use(repo)
    end
    if Packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    profile = { enable = true, threshold = 1 },
    auto_reload_compiled = true,
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})
