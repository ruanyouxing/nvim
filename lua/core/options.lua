local opt = vim.opt
local default_plugins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}

for _, plugin in pairs(default_plugins) do
  vim.g['loaded_' .. plugin] = 1
end
local cache_dir = vim.fn.stdpath 'cache' .. '/'
opt.directory = cache_dir .. 'swap/'
opt.undodir = cache_dir .. 'undo/'
opt.backupdir = cache_dir .. 'backup/'
opt.viewdir = cache_dir .. 'view/'
opt.spellfile = cache_dir .. 'spell/en.utf-8.add'
local options = {
  title = true,
  mouse = 'a',
  viewoptions = 'folds,cursor,curdir,slash,unix',
  sessionoptions = 'curdir,help,tabpages,winsize',
  clipboard = 'unnamedplus',

  ignorecase = true,
  smartcase = true,
  wildignorecase = true,
  wildignore = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**',

  backup = false,
  writebackup = false,
  swapfile = false,
  undofile = true,
  history = 2000,
  shada = "!,'300,<50,@100,s10,h",
  backupskip = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim',

  timeout = true,
  ttimeout = true,
  timeoutlen = 500,
  ttimeoutlen = 100,
  updatetime = 100,
  redrawtime = 1500,

  startofline = false,
  jumpoptions = 'stack',
  sidescrolloff = 5,
  ruler = false,
  list = true,
  previewheight = 12,
  showcmd = false,
  laststatus = 3,
  display = 'lastline',
  showbreak = '↳  ',
  listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←',
  pumblend = 10,
  signcolumn = 'yes',
  conceallevel = 2,
  concealcursor = 'nv',

  foldlevelstart = 99,
  foldmethod = 'expr',
  foldenable = true,
  foldcolumn = '1',
  foldexpr = 'v:lua.vim.treesitter.foldexpr()',
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],

  textwidth = 500,
  expandtab = true,
  smartindent = true,
  shiftround = true,
  tabstop = 2,
  shiftwidth = 2,
  breakindentopt = 'shift:2,min:20',
  number = true,
  relativenumber = true,

  termguicolors = true,
}

for k, v in pairs(options) do
  opt[k] = v
end

-- opt.fillchars:append({ diff = "-", fold = "-" })
