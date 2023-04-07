{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.devcontainer;
in {
  options.vim.devcontainer.enable = mkEnableOption "Enable nvim-dev-container";

  config = mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [devcontainer];
    vim.luaConfigRC = ''
      require("devcontainer").setup{}
    '';
  };
}
