{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./config.nix
    ./git.nix
    ./lazygit.nix
  ];
}
