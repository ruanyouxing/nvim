{ pkgs, ... }:
let
  nvim-treesitter-with-grammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    _: with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
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
  telescope-plugins = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-zoxide
  ];
in
{
  plugins = {
    start = with pkgs.vimPlugins; [
      lazy-nvim
      plenary-nvim
      friendly-snippets
      nvim-lspconfig
      nui-nvim
      nvim-treesitter-with-grammars
      nvim-ts-context-commentstring
      catppuccin-nvim
    ];
    opt =
      with pkgs.vimPlugins;
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
        bufdelete-nvim
        undotree
        nvim-comment
        better-escape-nvim
        none-ls-nvim
      ]
      ++ telescope-plugins
      ++ cmp-plugins;
    dev.nvim = {
      pure = pkgs.lib.cleanSource ../.;
      impure = "/home/hungz/.dotfiles/nvim";
    };
  };
}
