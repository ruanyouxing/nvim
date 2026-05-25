{
  imports = [
    ./dependencies.nix
    ./plugins.nix
  ];
  enable = true;
  initLua = "require('core')";
  extraBuilderArgs.meta = {
    description = "Neovim wrapped with mnw";
    longDescription = "Neovim with custom config, plugins, and LSP toolchain managed via mnw";
    homepage = "https://neovim.io";
    license = pkgs.lib.licenses.asl20;
    platforms = pkgs.lib.platforms.all;
    teams = [ ];
  };
}
