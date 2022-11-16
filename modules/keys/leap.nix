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
  options.vim.keys.leap.enable = mkEnableOption "leap.nvim";

  config = mkIf (cfg.enable && cfg.leap.enable) {
    vim.startPlugins = with pkgs.neovimPlugins; [leap pkgs.vimPlugins.vim-repeat];

    vim.luaConfigRC = ''
      -- Enable leap.nvim
      require("leap").add_default_mappings()
    '';
  };
}
