{
  description = "neovim wrapper flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    mnw.url = "github:Gerg-L/mnw";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    mnw,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem = {
        pkgs,
        system,
        ...
      }: let
        neovim = mnw.lib.wrap {inherit inputs pkgs;} ./nix;
        depsAttr = import ./nix/dependencies.nix {inherit pkgs;};
      in {
        _module.args.pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        legacyPackages.nvimDepedencies = depsAttr.extraBinPath;
        packages = {
          inherit neovim;
          inherit (neovim) devMode;

          default = neovim;
          nvim-dependencies = pkgs.buildEnv {
            name = "nvim-dependencies";
            paths = depsAttr.extraBinPath;
          };
        };
      };
    };
}
