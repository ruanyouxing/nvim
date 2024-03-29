local cache_dir = os.getenv 'HOME' .. '/.cache/nvim/'

vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.fileformats = 'unix,mac,dos'
vim.opt.magic = true
vim.opt.fileencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.viewoptions = 'folds,cursor,curdir,slash,unix'
vim.opt.sessionoptions = 'curdir,help,tabpages,winsize'
vim.opt.clipboard = 'unnamedplus'
vim.opt.wildignorecase = true
vim.opt.wildignore =
  '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.directory = cache_dir .. 'swag/'
vim.opt.undofile = true
vim.opt.undodir = cache_dir .. 'undo/'
vim.opt.backupdir = cache_dir .. 'backup/'
vim.opt.viewdir = cache_dir .. 'view/'
vim.opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
vim.opt.history = 2000
vim.opt.shada = "!,'300,<50,@100,s10,h"
vim.opt.backupskip = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim'
vim.opt.smarttab = true
vim.opt.shiftround = true
vim.opt.timeout = true
vim.opt.timeoutlen = 200
vim.opt.updatetime = 100
vim.opt.redrawtime = 1500
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.startofline = false
vim.opt.backspace = 'indent,eol,start'
vim.opt.jumpoptions = 'stack'
vim.opt.sidescrolloff = 5
vim.opt.fillchars.append = '-'
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'manual'
vim.opt.ruler = false
vim.opt.list = true
vim.opt.previewheight = 12
vim.opt.showcmd = false
vim.opt.laststatus = 3
vim.opt.display = 'lastline'
vim.opt.showbreak = '↳  '
vim.opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
vim.opt.pumblend = 10

vim.opt.textwidth = 80
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.breakindentopt = 'shift:2,min:20'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.foldenable = true
vim.opt.signcolumn = 'yes'
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nv'

vim.g.syntax_on = true
vim.g.smartindent = true
vim.g.loaded_matchit = 1
vim.g.matchup_surround_enabled = 1
vim.cmd [[hi NonText guifg=bg]]
