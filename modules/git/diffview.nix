{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.vim.git;
in {
  options.vim.git.diffview.enable = mkEnableOption "enable diffview.nvim";

  config = mkIf (cfg.enable && cfg.diffview.enable) {
    vim.startPlugins = with pkgs.neovimPlugins; [diffview-nvim];

    vim.luaConfigRC = ''
      -- Enable diffview.nvim
      local actions = require("diffview.actions")

      require("diffview").setup()
    '';
  };
}
