{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.keys;
in {
  options.vim.keys.kommentary.enable = mkEnableOption "kommentary.nvim";

  config = mkIf (cfg.enable && cfg.kommentary.enable) {
    vim.startPlugins = with pkgs.neovimPlugins; [kommentary];

    vim.luaConfigRC = ''
      -- Enable kommentary
      require('kommentary.config').use_extended_mappings()
    '';
  };
}
