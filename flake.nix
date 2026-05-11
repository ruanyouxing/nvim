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
      perSystem = {pkgs, ...}: let
        neovim = mnw.lib.wrap {inherit inputs pkgs;} ./nix;
      in {
        _module.args.pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        packages = {
          inherit neovim;
          inherit (neovim) devMode;

          default = neovim;
        };
      };
    };
}
