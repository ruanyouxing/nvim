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
  tool-plugins = with pkgs.vimPlugins; [
  ];
  ui-plugins = with pkgs.vimPlugins; [
  ];
  editor-plugins = with pkgs.vimPlugins; [
  ];
in {
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
    opt = with pkgs.vimPlugins; [
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
    ];
    dev.nvim = {
      pure = pkgs.lib.cleanSource ../.;
      impure = "/home/hungz/.dotfiles/nvim";
    };
  };
}
