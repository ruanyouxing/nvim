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
      friendly-snippets
      nvim-lspconfig
      nui-nvim
      nvim-treesitter-with-grammars
      nvim-ts-context-commentstring
    ];
    dev.hungz = {
      pure = ../.;
      impure = "/home/hungz/.dotfiles/nvim";
    };
  };
}
