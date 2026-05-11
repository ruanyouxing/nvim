{
  imports = [
    ./dependencies.nix
    ./plugins.nix
  ];
  enable = true;
  initLua = "require('core')";
}
