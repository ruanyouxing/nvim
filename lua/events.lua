local events = {}

local cmd = vim.api.nvim_command
function events.initialize(augroup)
for group_name, definition in pairs(augroup) do
        cmd("augroup " .. group_name)
        cmd("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
            cmd(command)
        end
        cmd("augroup END")
    end

end

local augroup =  {
	yank = {
		{'TextYankPost','*','silent! lua vim.highlight.on_yank(higroup="IncSearch",timeout=301)'}
	},
	specs = {
		{'CursorMoved','*','lua require("specs").show_specs()'},
	},
	autoload = {
	--	{'InsertLeave','*.lua','source %'},
		{'TextChanged','.Xresources','!xrdb ~/.Xresources'}
	},
}

function events.load_groups()
	events.initialize(augroup)
end

return events
