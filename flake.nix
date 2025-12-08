{
  description = "ruanyouxing neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    root = ./.;
  in {
    hmConfig = {
      home = {
        sessionVariables = {
          NVIM_APPNAME = "nvim-config";
        };
        packages = with pkgs; [
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
        file.".config/nvim-config".source = root;
      };
      programs.neovim = {
        enable = true;
        defaultEditor = true;
      };
    };
    packages.${system}.default = pkgs.stdenv.mkDerivation {
      name = "nvim-config";
      phases = ["installPhase"];
      installPhase = ''
        mkdir -p $out
        cp -r ${root} $out
      '';
    };
  };
}
