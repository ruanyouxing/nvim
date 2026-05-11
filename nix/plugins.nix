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
in {
  plugins = {
    start = with pkgs.vimPlugins; [
      lazy-nvim
      plenary-nvim
      promise-async
      snacks-nvim
      nvim-lspconfig
      nui-nvim
      nvim-nio
      nvim-treesitter-with-grammars
      dressing-nvim
      catppuccin-nvim
    ];
    opt = with pkgs.vimPlugins; [
      smart-splits-nvim
      markdown-preview-nvim
    ];
    dev.nvim = {
      pure = pkgs.lib.cleanSource ../.;
      impure = "/home/hungz/.dotfiles/nvim";
    };
  };
}
