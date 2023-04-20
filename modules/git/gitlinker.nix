{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.git;
in {
  options.vim.git.gitlinker.enable = mkEnableOption "gitlinker-nvim";

  config = mkIf (cfg.enable && cfg.gitlinker.enable) {
    vim.startPlugins = with pkgs.neovimPlugins; [gitlinker-nvim];

    vim.luaConfigRC = ''
      -- Enable gitlinker.nvim
      require"gitlinker".setup()
    '';
  };
}
