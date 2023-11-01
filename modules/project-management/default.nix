{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.project-management;
in {
  imports = [./autosave.nix];

  options.vim = {
    project-management = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "enable project management";
      };
    };
  };

  config = mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [
      neovim-project
      plenary-nvim
      telescope
      neovim-session-manager
    ];

    vim.nnoremap = lib.mkIf config.vim.telescope.enable {
      "<silent><leader>op" = ":Telescope neovim-project history<CR>";
      "<silent><leader>oc" = ":Telescope neovim-project discover<CR>";
    };
    vim.luaConfigRC = ''
      vim.opt.sessionoptions = { "globals" }
      require("neovim-project").setup {
        projects = { -- define project roots
          "~/code/*",
          "~/projects/*",
        },
      }
    '';
  };
}
