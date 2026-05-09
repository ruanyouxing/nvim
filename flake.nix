{
  description = "neovim wrapper flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        extraPackages = with pkgs; [
          lua-language-server
          stylua
          clang-tools
          pyright
          black
          pylint
          nil
          nixpkgs-fmt
          ripgrep
          fd
          tree-sitter
          gcc
          gnumake
          fd
          fzf
          ripgrep
          lazygit
          luajit
          nodejs
          yarn
          python311Packages.pip
          haskellPackages.greenclip
          eslint_d
          nodePackages.prettier
          clang-tools
          ccls
          lldb
          python310Packages.debugpy
          black
          stylua
          shellcheck
          alejandra
          lua-language-server
        ];

        wrappedNeovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath extraPackages}"'';
        };

        runNvimLocal = pkgs.writeShellScriptBin "run-nvim" ''
          if [ -f "$PWD/init.lua" ]; then
            echo "Loading local configuration from $PWD/init.lua..."
            exec ${wrappedNeovim}/bin/nvim -u "$PWD/init.lua" "$@"
          else
            echo "Warning: No init.lua found in the project root. Loading default configuration."
            exec ${wrappedNeovim}/bin/nvim "$@"
          fi
        '';
      in
      {
        packages = {
          default = wrappedNeovim;
          neovim = wrappedNeovim;
        };

        apps = {
          default = {
            type = "app";
            program = "${runNvimLocal}/bin/run-nvim";
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [ wrappedNeovim ] ++ extraPackages;
        };
      }
    )
    // {
      overlays.default = final: prev: {
        custom-neovim = self.packages.${prev.system}.neovim;
      };
    };
}
