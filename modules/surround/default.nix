{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.surround;
in {
  options.vim.surround.enable = mkEnableOption "nvim-surround support";

  config = mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [nvim-surround];

    vim.luaConfigRC = ''
      -- nvim-surround
      require("nvim-surround").setup({
      })
    '';
  };
}
