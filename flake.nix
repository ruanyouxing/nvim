{
  description = "neovim wrapper flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        extraPackages = with pkgs; [
          lua-language-server stylua clang-tools ccls pyright
          python313Packages.debugpy python313Packages.pip black pylint nil
          nixpkgs-fmt alejandra eslint_d prettier shellcheck
          ripgrep fd tree-sitter gcc gnumake fzf lazygit luajit nodejs yarn
          haskellPackages.greenclip lldb
        ];

        wrappedNeovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath extraPackages}"'';
        };

        runNvimLocal = pkgs.writeShellScriptBin "run-nvim" ''
          if [ -f "$PWD/init.lua" ]; then
            echo "Loading local configuration from $PWD..."
            export REAL_XDG_CONFIG_HOME="''${XDG_CONFIG_HOME:-$HOME/.config}"
            export TEMP_CONFIG_HOME=$(mktemp -d)
            ln -s "$PWD" "$TEMP_CONFIG_HOME/nvim"
            export XDG_CONFIG_HOME="$TEMP_CONFIG_HOME"

            trap 'rm -rf "$TEMP_CONFIG_HOME"' EXIT

            exec ${wrappedNeovim}/bin/nvim -c "lua vim.env.XDG_CONFIG_HOME = vim.env.REAL_XDG_CONFIG_HOME" "$@"
          else
            echo "Warning: No init.lua found in current directory. Running bare Neovim."
            exec ${wrappedNeovim}/bin/nvim "$@"
          fi
        '';

        nvimConfigHome = pkgs.stdenv.mkDerivation {
          name = "nvim-config-home";
          src = pkgs.lib.cleanSource ./.;
          installPhase = ''
            mkdir -p $out/nvim
            cp -a . $out/nvim/
          '';
        };

        packagedNeovim = pkgs.symlinkJoin {
          name = "custom-neovim";
          paths = [ wrappedNeovim ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/nvim \
              --run 'export REAL_XDG_CONFIG_HOME="''${XDG_CONFIG_HOME:-$HOME/.config}"' \
              --set XDG_CONFIG_HOME "${nvimConfigHome}" \
              --add-flags '-c "lua vim.env.XDG_CONFIG_HOME = vim.env.REAL_XDG_CONFIG_HOME"'
          '';
        };

      in {
        packages = {
          default = packagedNeovim;
          neovim = packagedNeovim;
        };

        apps = {
          default = {
            type = "app";
            program = "${packagedNeovim}/bin/nvim";
            meta = {
              description = "Launch the fully packaged Neovim";
            };
          };
          
          dev = {
            type = "app";
            program = "${runNvimLocal}/bin/run-nvim";
            meta = {
              description = "Launch Neovim using the local repository's configuration";
            };
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [ wrappedNeovim ] ++ extraPackages;
        };
      }
    ) // {
      overlays.default = final: prev: {
        custom-neovim = self.packages.${prev.system}.neovim;
      };
    };
}
