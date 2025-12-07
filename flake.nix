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
