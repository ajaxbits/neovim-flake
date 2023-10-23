{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.autocomplete;
in {
  config = mkIf cfg.copilot.enable (
    let
      writeIf = cond: msg:
        if cond
        then msg
        else "";
    in {
      vim.startPlugins = with pkgs.neovimPlugins;
        [copilot]
        ++ (
          if cfg.type == "nvim-cmp"
          then [
            copilot-cmp
          ]
          else []
        );

      vim.luaConfigRC =
        ''
          require("copilot").setup({
            suggestion = {
              enabled = false;
            },
            panel = {
              enabled = false;
            },
            filetypes = {
              markdown = false;
              yaml = true;
            },
            copilot_node_command = "${pkgs.nodejs}/bin/node",
          })
        ''
        + (
          if cfg.copilot.enable
          then "require('copilot_cmp').setup()"
          else ""
        );
    }
  );
}
