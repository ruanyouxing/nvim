local key = require 'core.keymap'
local nmap = key.nmap
local plug = key.plug

nmap {
  { '<C-]>', plug 'cokeline-focus-next' },
  { '<C-[>', plug 'cokeline-focus-prev' },
  { '<Tab>', plug 'cokeline-switch-next' },
  { '<S-Tab>', plug 'cokeline-switch-prev' },
}
for i = 1, 9 do
  nmap {
    { ('<F%s>'):format(i), (plug 'cokeline-focus-%s)'):format(i) },
    { ('<Leader>%s'):format(i), (plug 'cokeline-switch-%s)'):format(i) },
  }
end
