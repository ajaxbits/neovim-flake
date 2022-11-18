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
      require('kommentary.config').configure_language("default", {
        prefer_single_line_comments = true,
      })
      require('kommentary.config').configure_language("nix", {
        prefer_single_line_comments = true,
        single_line_comment_string = "#",
        multi_line_comment_strings = {"/*", "*/"},
      })
    '';
  };
}
