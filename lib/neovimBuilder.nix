{
  pkgs,
  lib ? pkgs.lib,
  ...
}: {config}: let
  inherit (pkgs) neovimPlugins;

  myNeovimUnwrapped = pkgs.neovim-unwrapped;

  vimOptions = lib.evalModules {
    modules = [
      {imports = [../modules];}
      config
    ];

    specialArgs = {
      inherit pkgs;
    };
  };

  inherit (vimOptions.config) vim;
in
  pkgs.wrapNeovim myNeovimUnwrapped {
    inherit (vim) viAlias;
    inherit (vim) vimAlias;
    configure = {
      customRC = vim.configRC;

      packages.myVimPackage = {
        start = builtins.filter (f: f != null) vim.startPlugins;
        opt = vim.optPlugins;
      };
    };
  }
