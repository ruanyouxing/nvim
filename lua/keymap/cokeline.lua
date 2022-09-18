local key = require 'core.keymap'
local nmap = key.nmap
local plug = key.plug
local defaults = key.new_opts(key.noremap, key.silent)

nmap {
  { '<C-]>', plug 'cokeline-focus-next', defaults },
  { '<C-[>', plug 'cokeline-focus-prev', defaults },
  { '<Tab>', plug 'cokeline-switch-next', defaults },
  { '<S-Tab>', plug 'cokeline-switch-prev', defaults },
}
for i = 1, 9 do
  nmap {
    { ('<F%s>'):format(i), (plug 'cokeline-focus-%s)'):format(i), defaults },
    { ('<Leader>%s'):format(i), (plug 'cokeline-switch-%s)'):format(i), defaults },
  }
end
