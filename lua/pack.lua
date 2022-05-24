local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.cmd("!git clone https://github.com/wbthomason/packer.nvim ".. install_path)
  vim.cmd('packadd packer.nvim')
end

return require('packer').startup({function(use)
  use {'wbthomason/packer.nvim'}
  local repos = require('plugins')
	for i in ipairs(repos) do
		use(repos[i])
	end
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
		profile = {enable = true,threshold = 1},
		auto_reload_compiled = true,
		display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end,
}}})
