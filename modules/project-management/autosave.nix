{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.vim.project-management.autosave;
in {
  options.vim.project-management.autosave.enable = lib.mkEnableOption "autosave";

  config = lib.mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [auto-save-nvim];
    vim.luaConfigRC = ''
      vim.api.nvim_set_keymap("n", "<leader>ts", ":ASToggle<CR>", {})
      require("auto-save").setup { }
    '';
  };
}
