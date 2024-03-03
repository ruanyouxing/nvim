# ruanyouxing neovim dotfiles

<a href="https://dotfyle.com/ruanyouxing/nvim"><img src="https://dotfyle.com/ruanyouxing/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/ruanyouxing/nvim"><img src="https://dotfyle.com/ruanyouxing/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/ruanyouxing/nvim"><img src="https://dotfyle.com/ruanyouxing/nvim/badges/plugin-manager?style=flat" /></a>

<img src="https://raw.githubusercontent.com/ruanyouxing/nvim/main/screenshot.png"> 
<h4 style="text-align: center;"> le screenshot </h4>

## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:ruanyouxing/nvim ~/.config/ruanyouxing/nvim
NVIM_APPNAME=ruanyouxing/nvim/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=ruanyouxing/nvim/ nvim
```

## Plugins

### bars-and-lines

+ [lukas-reineke/virt-column.nvim](https://dotfyle.com/plugins/lukas-reineke/virt-column.nvim)
+ [luukvbaal/statuscol.nvim](https://dotfyle.com/plugins/luukvbaal/statuscol.nvim)
+ [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
+ [utilyre/barbecue.nvim](https://dotfyle.com/plugins/utilyre/barbecue.nvim)
### code-runner

+ [stevearc/overseer.nvim](https://dotfyle.com/plugins/stevearc/overseer.nvim)
### color

+ [ziontee113/color-picker.nvim](https://dotfyle.com/plugins/ziontee113/color-picker.nvim)
+ [mvllow/modes.nvim](https://dotfyle.com/plugins/mvllow/modes.nvim)
+ [folke/twilight.nvim](https://dotfyle.com/plugins/folke/twilight.nvim)
### colorscheme

+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
+ [rose-pine/neovim](https://dotfyle.com/plugins/rose-pine/neovim)
+ [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
### command-line

+ [gelguy/wilder.nvim](https://dotfyle.com/plugins/gelguy/wilder.nvim)
### comment

+ [terrortylor/nvim-comment](https://dotfyle.com/plugins/terrortylor/nvim-comment)
+ [JoosepAlviste/nvim-ts-context-commentstring](https://dotfyle.com/plugins/JoosepAlviste/nvim-ts-context-commentstring)
### competitive-programming

+ [xeluxee/competitest.nvim](https://dotfyle.com/plugins/xeluxee/competitest.nvim)
+ [kawre/leetcode.nvim](https://dotfyle.com/plugins/kawre/leetcode.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### cursorline

+ [yamatsum/nvim-cursorline](https://dotfyle.com/plugins/yamatsum/nvim-cursorline)
### debugging

+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [Pocco81/AutoSave.nvim](https://dotfyle.com/plugins/Pocco81/AutoSave.nvim)
+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
+ [gbprod/stay-in-place.nvim](https://dotfyle.com/plugins/gbprod/stay-in-place.nvim)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
+ [gbprod/yanky.nvim](https://dotfyle.com/plugins/gbprod/yanky.nvim)
+ [Pocco81/HighStr.nvim](https://dotfyle.com/plugins/Pocco81/HighStr.nvim)
### file-explorer

+ [is0n/fm-nvim](https://dotfyle.com/plugins/is0n/fm-nvim)
+ [kyazdani42/nvim-tree.lua](https://dotfyle.com/plugins/kyazdani42/nvim-tree.lua)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
+ [jvgrootveld/telescope-zoxide](https://dotfyle.com/plugins/jvgrootveld/telescope-zoxide)
### git

+ [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
### icon

+ [ziontee113/icon-picker.nvim](https://dotfyle.com/plugins/ziontee113/icon-picker.nvim)
+ [kyazdani42/nvim-web-devicons](https://dotfyle.com/plugins/kyazdani42/nvim-web-devicons)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### keybinding

+ [anuvyklack/hydra.nvim](https://dotfyle.com/plugins/anuvyklack/hydra.nvim)
+ [max397574/better-escape.nvim](https://dotfyle.com/plugins/max397574/better-escape.nvim)
### lsp

+ [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
+ [hinell/lsp-timeout.nvim](https://dotfyle.com/plugins/hinell/lsp-timeout.nvim)
+ [nvimtools/none-ls.nvim](https://dotfyle.com/plugins/nvimtools/none-ls.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [SmiteshP/nvim-navbuddy](https://dotfyle.com/plugins/SmiteshP/nvim-navbuddy)
+ [kosayoda/nvim-lightbulb](https://dotfyle.com/plugins/kosayoda/nvim-lightbulb)
+ [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
+ [RishabhRD/nvim-lsputils](https://dotfyle.com/plugins/RishabhRD/nvim-lsputils)
+ [j-hui/fidget.nvim](https://dotfyle.com/plugins/j-hui/fidget.nvim)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### markdown-and-latex

+ [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)
### marks

+ [LeonHeidelbach/trailblazer.nvim](https://dotfyle.com/plugins/LeonHeidelbach/trailblazer.nvim)
### motion

+ [gsuuon/tshjkl.nvim](https://dotfyle.com/plugins/gsuuon/tshjkl.nvim)
+ [phaazon/hop.nvim](https://dotfyle.com/plugins/phaazon/hop.nvim)
+ [chrisgrieser/nvim-spider](https://dotfyle.com/plugins/chrisgrieser/nvim-spider)
+ [edluffy/specs.nvim](https://dotfyle.com/plugins/edluffy/specs.nvim)
+ [abecodes/tabout.nvim](https://dotfyle.com/plugins/abecodes/tabout.nvim)
### nvim-dev

+ [nvim-lua/popup.nvim](https://dotfyle.com/plugins/nvim-lua/popup.nvim)
+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### scrollbar

+ [gorbit99/codewindow.nvim](https://dotfyle.com/plugins/gorbit99/codewindow.nvim)
### search

+ [kevinhwang91/nvim-hlslens](https://dotfyle.com/plugins/kevinhwang91/nvim-hlslens)
### session

+ [olimorris/persisted.nvim](https://dotfyle.com/plugins/olimorris/persisted.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
### split-and-window

+ [mrjones2014/smart-splits.nvim](https://dotfyle.com/plugins/mrjones2014/smart-splits.nvim)
+ [famiu/bufdelete.nvim](https://dotfyle.com/plugins/famiu/bufdelete.nvim)
### startup

+ [glepnir/dashboard-nvim](https://dotfyle.com/plugins/glepnir/dashboard-nvim)
### statusline

+ [windwp/windline.nvim](https://dotfyle.com/plugins/windwp/windline.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
### utility

+ [kevinhwang91/nvim-fundo](https://dotfyle.com/plugins/kevinhwang91/nvim-fundo)
+ [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)
+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
+ [sontungexpt/url-open](https://dotfyle.com/plugins/sontungexpt/url-open)
+ [axkirillov/hbac.nvim](https://dotfyle.com/plugins/axkirillov/hbac.nvim)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
## Language Servers

+ bashls
+ clangd
+ cssls
+ html
+ jsonls
+ lua_ls
+ pyright
+ rust_analyzer
+ tsserver


 This readme was generated by [Dotfyle](https://dotfyle.com)
