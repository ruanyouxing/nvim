{pkgs, ...}: let
  nvim-treesitter-with-grammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    _:
      with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        bash
        c
        cpp
        fish
        lua
        json
        yaml
        make
        python
        rust
        nix
        html
        javascript
        typescript
        query
        css
        qmljs
      ]
  );
  cmp-plugins = with pkgs.vimPlugins; [
    nvim-cmp
    cmp-nvim-lua
    cmp-nvim-lsp
    cmp-calc
    cmp-latex-symbols
    cmp-treesitter
    cmp_luasnip
    cmp-path
    cmp-buffer
    cmp-emoji
    cmp-nvim-lsp-document-symbol
    cmp-look
    cmp-spell
    luasnip
    LuaSnip-snippets-nvim
    # cmp-emoji
    # cmp-render-markdown
  ];
  tools-plugins = with pkgs.vimPlugins; [
    competitest-nvim
    hydra-nvim
    nvim-dap
    nvim-dap-ui
    nvim-spectre
    overseer-nvim
    toggleterm-nvim
    trailblazer-nvim
  ];
  telescope-plugins = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-zoxide
    telescope-media-files-nvim
  ];
  editing-plugins = with pkgs.vimPlugins; [
    autosave-nvim
    persisted-nvim
    better-escape-nvim
    bufdelete-nvim
    undotree
    nvim-comment
    none-ls-nvim
    diffview-nvim
    gitsigns-nvim
    faster-nvim
    hop-nvim
    keymap-layer-nvim
    nvim-autopairs
    nvim-spider
    smart-splits-nvim
    tabout-nvim
    vim-matchup
    yanky-nvim
  ];
  lang-plugins = with pkgs.vimPlugins; [
    headlines-nvim
    markdown-preview-nvim
    render-markdown-nvim
    vim-nix
    yuck-vim
  ];
  ui-plugins = with pkgs.vimPlugins; [
    barbecue-nvim
    fidget-nvim
    kanagawa-nvim
    nvim-cokeline
    nvim-colorizer-lua
    nvim-cursorline
    nvim-lightbulb
    nvim-navic
    nvim-ufo
    nvim-web-devicons
    outline-nvim
    popup-nvim
    rose-pine
    specs-nvim
    trouble-nvim
  ];
  lsp-plugins = with pkgs.vimPlugins; [
    clangd_extensions-nvim
    lazy-lsp-nvim
    lspkind-nvim
    nvim-lspconfig
  ];
in {
  plugins = {
    start = with pkgs.vimPlugins; [
      lazy-nvim
      plenary-nvim
      promise-async
      snacks-nvim
      friendly-snippets
      nvim-lspconfig
      nui-nvim
      nvim-nio
      nvim-treesitter-with-grammars
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-ts-autotag
      nvim-ts-context-commentstring
      dressing-nvim
      catppuccin-nvim
    ];
    opt = with pkgs.vimPlugins;
      [
        nvim-navbuddy
        which-key-nvim
        dashboard-nvim
        indent-blankline-nvim
        noice-nvim
        neo-tree-nvim
        nvim-notify
        statuscol-nvim
        neovim-ayu
        tokyonight-nvim
        twilight-nvim
        virt-column-nvim
        wilder-nvim
      ]
      ++ telescope-plugins
      ++ cmp-plugins
      ++ editing-plugins
      ++ lang-plugins
      ++ ui-plugins
      ++ lsp-plugins
      ++ tools-plugins;
    dev.nvim = {
      pure = pkgs.lib.cleanSource ../.;
      impure = "/home/hungz/.dotfiles/nvim";
    };
  };
}
