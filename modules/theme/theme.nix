{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.theme;
in {
  options.vim.theme = {
    enable = mkOption {
      type = types.bool;
      description = "Enable Theme";
    };

    name = mkOption {
      type = types.enum ["onedark" "tokyonight" "gruvbox"];
      description = ''Name of theme to use: "onedark" "tokyonight" "gruvbox'';
    };

    style = mkOption {
      type = with types; (
        if (cfg.name == "tokyonight")
        then (enum ["day" "night" "storm"])
        else (enum ["dark" "darker" "cool" "deep" "warm" "warmer"])
      );
      description = ''Theme style: "storm", darker variant "night", and "day"'';
    };
  };

  config =
    mkIf cfg.enable
    (
      let
        mkVimBool = val:
          if val
          then "1"
          else "0";
      in {
        vim.configRC = mkIf (cfg.name == "tokyonight") ''
          " need to set style before colorscheme to apply
          let g:${cfg.name}_style = "${cfg.style}"
          colorscheme ${cfg.name}
        '';

        vim.startPlugins = with pkgs.neovimPlugins;
          if (cfg.name == "gruvbox")
          then [gruvbox]
          else [onedark];

        vim.luaConfigRC = mkMerge [
          (mkIf (cfg.name == "gruvbox") ''
            -- Gruvbox theme
            require("gruvbox").setup({
              undercurl = true,
              underline = true,
              bold = true,
              italic = true,
              strikethrough = true,
              invert_selection = false,
              invert_signs = false,
              invert_tabline = false,
              invert_intend_guides = false,
              inverse = true, -- invert background for search, diffs, statuslines and errors
              contrast = "", -- can be "hard", "soft" or empty string
              palette_overrides = {},
              overrides = {},
              dim_inactive = false,
              transparent_mode = false,
            })
            vim.cmd("colorscheme gruvbox")
          '')
          (mkIf (cfg.name == "onedark") ''
            -- OneDark theme
            require('onedark').setup {
              style = "${cfg.style}"
            }
            require('onedark').load()
          '')
        ];
      }
    );
}
