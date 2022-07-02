local config = {}
function config.mapping()
	local nmap = function(key,cmd) return vim.keymap.set('n',key,cmd,{}) end
	nmap('ca',function() vim.lsp.buf.code_action() end)
end
return config
