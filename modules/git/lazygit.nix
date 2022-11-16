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
  options.vim.git.lazygit.enable = mkEnableOption "lazygit";

  config = mkIf (cfg.enable && cfg.lazygit.enable) {
    vim.startPlugins = with pkgs.neovimPlugins; [lazygit];

    vim.nnoremap = {
      "<silent><leader>gg" = ":LazyGit<CR>";
    };
  };
}
