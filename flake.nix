{
  description = "neovim wrapper flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        extraPackages = with pkgs; [
          lua-language-server
          stylua
          clang-tools
          ccls
          pyright
          python313Packages.debugpy
          python313Packages.pip
          black
          nil
          nixpkgs-fmt
          alejandra
          eslint_d
          prettier
          shellcheck
          ripgrep
          fd
          tree-sitter
          gcc
          gnumake
          fzf
          lazygit
          luajit
          lua5
          luarocks
          nodejs
          yarn
          haskellPackages.greenclip
          lldb
        ];

        wrappedNeovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
          extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath extraPackages}"'';
        };

        runNvimLocal = pkgs.writeShellScriptBin "run-nvim" ''
          if [ -f "$PWD/init.lua" ]; then
            echo "Loading local configuration from $PWD..."
            export CUSTOM_NVIM_DIR="$PWD"
            exec ${wrappedNeovim}/bin/nvim \
              --cmd "set rtp^=$PWD" \
              -u "$PWD/init.lua" "$@"
          else
            echo "Warning: No init.lua found in the current directory."
            exec ${wrappedNeovim}/bin/nvim "$@"
          fi
        '';

        nvimConfigDir = pkgs.stdenv.mkDerivation {
          name = "nvim-config";
          src = pkgs.lib.cleanSource ./.;
          installPhase = ''
            mkdir -p $out/nvim
            cp -a . $out/nvim/
          '';
        };
        packagedNeovim = pkgs.symlinkJoin {
          name = "custom-neovim";
          paths = [wrappedNeovim];
          nativeBuildInputs = [pkgs.makeWrapper];
          postBuild = ''
            wrapProgram $out/bin/nvim \
              --set CUSTOM_NVIM_DIR "${nvimConfigDir}" \
              --add-flags "--cmd \"set rtp^=${nvimConfigDir}\"" \
              --add-flags "-u ${nvimConfigDir}/init.lua"
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
            program = "${runNvimLocal}/bin/run-nvim";
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [wrappedNeovim] ++ extraPackages;
        };
      }
    )
    // {
      overlays.default = final: prev: {
        custom-neovim = self.packages.${prev.system}.default;
      };
    };
}
