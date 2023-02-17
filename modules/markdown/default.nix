{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./config.nix
    ./preview.nix
  ];
}
