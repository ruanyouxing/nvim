{
  description = "ruanyouxing neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      root = ./.;
    in
    {
      home = {
        xdg.configFile."nvim-config".source = root;
        sessionVariables = {
          NVIM_APPNAME = "nvim-config";
        };
      };
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "nvim-config";
        phases = [ "installPhase" ];
        installPhase = ''
          mkdir -p $out
          cp -r ${root} $out
        '';
      };
      utils = with pkgs; [
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
    };
}
