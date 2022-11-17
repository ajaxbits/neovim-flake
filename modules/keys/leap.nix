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
  options.vim.keys.leap = {
    enable = mkEnableOption "leap.nvim";
    ast = mkOption {
      default = false;
      description = "Enable leap-ast.nvim -- a treesitter plugin for leap.nvim";
      type = types.bool;
    };
    spooky = mkOption {
      default = false;
      description = "Enable leap-spooky.nvim -- a remote operations plugin for leap.nvim";
      type = types.bool;
    };
  };

  config = mkIf (cfg.enable && cfg.leap.enable) {
    vim.startPlugins = with pkgs.neovimPlugins; [
      leap
      pkgs.vimPlugins.vim-repeat
      (
        if cfg.leap.ast
        then leap-ast
        else null
      )
      (
        if cfg.leap.spooky
        then leap-spooky
        else null
      )
    ];

    vim.luaConfigRC = ''
      -- Enable leap.nvim
      require("leap").add_default_mappings()
      ${
        if cfg.leap.ast
        then ''
          -- Enable leap-ast.nvim
          vim.keymap.set({"n", "x", "o"}, "<leader>ll", function() require"leap-ast".leap() end, {})
        ''
        else ""
      }
      ${
        if cfg.leap.spooky
        then ''
          -- Enable leap-spooky.nvim
          require("leap-spooky").setup()
        ''
        else ""
      }
    '';
  };
}
