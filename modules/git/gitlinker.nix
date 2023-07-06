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

      vim.api.nvim_set_keymap('n', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>', {silent = true})
      vim.api.nvim_set_keymap('n', '<leader>gw', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
    '';
  };
}
