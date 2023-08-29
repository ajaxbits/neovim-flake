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
  options.vim.git = {
    enable = mkOption {
      type = types.bool;
      description = "Enable git plugins";
    };

    gitsigns.enable = mkOption {
      type = types.bool;
      description = "Enable git options";
    };
  };

  config =
    mkIf cfg.enable
    {
      vim.startPlugins = with pkgs.neovimPlugins;
        if (cfg.gitsigns.enable)
        then [gitsigns-nvim]
        else [];

      vim.luaConfigRC = mkIf (cfg.gitsigns.enable) ''
        -- GitSigns setup
        require('gitsigns').setup {
          on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            map('n', '<leader>gs', gs.stage_hunk)
            map('v', '<leader>gs', gs.stage_hunk)
            map('n', '<leader>gr', gs.reset_hunk)
            map('v', '<leader>gr', gs.reset_hunk)
            map('n', '<leader>gr', gs.reset_buffer)
            map('n', '<leader>gb', gs.blame_line{full=true})
            map('n', '<leader>gts', gs.toggle_signs)
            map('n', '<leader>gtn', gs.toggle_numhl)
            map('n', '<leader>gtl', gs.toggle_linehl)
            map('n', '<leader>gtw', gs.toggle_word_diff)
          },
        }
      '';
    };
}
