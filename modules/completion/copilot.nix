{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.autocomplete;

  ft-includes = [
    "python"
    "terraform"
    "javascript"
    "rust"
  ];
  # TODO: Write a function that does this better
  ft-excludes = ["markdown"];
in {
  config = mkIf (cfg.copilot.enable) (
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
              auto_trigger = false;
            },
            filetypes = {
              markdown = false;
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
