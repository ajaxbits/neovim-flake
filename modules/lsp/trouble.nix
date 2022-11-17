{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.lsp;
in {
  options.vim.lsp = {
    trouble = {
      enable = mkEnableOption "trouble diagnostics viewer";
    };
    todo-comments = {
      enable = mkEnableOption "todo-comments in trouble";
    };
  };

  config = mkIf (cfg.enable && cfg.trouble.enable) {
    vim.startPlugins = with pkgs.neovimPlugins; [
      trouble
      (
        if cfg.todo-comments.enable
        then todo-comments
        else null
      )
    ];

    vim.nnoremap =
      {
        "<leader>xx" = "<cmd>TroubleToggle<CR>";
        "<leader>lwd" = "<cmd>TroubleToggle workspace_diagnostics<CR>";
        "<leader>ld" = "<cmd>TroubleToggle document_diagnostics<CR>";
        "<leader>lr" = "<cmd>TroubleToggle lsp_references<CR>";
        "<leader>xq" = "<cmd>TroubleToggle quickfix<CR>";
        "<leader>xl" = "<cmd>TroubleToggle loclist<CR>";
      }
      // (
        if cfg.todo-comments.enable
        then {
          "<leader>tl" = "<cmd>TodoTrouble<CR>";
        }
        else {}
      );

    vim.luaConfigRC = ''
      -- Enable trouble diagnostics viewer
      require("trouble").setup {}
      ${(
        if cfg.todo-comments.enable
        then ''
          require("todo-comments").setup()
        ''
        else ""
      )}
    '';
  };
}
