{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.markdown;
in {
  options.vim.markdown = {
    enable = mkEnableOption "markdown tools and plugins";

    glow.enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable markdown preview in neovim with glow";
    };

    markdown-preview.enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable markdown preview in neovim with glow";
    };
  };

  config = mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [
      (
        if cfg.glow.enable
        then glow-nvim
        else null
      )
      (
        if cfg.markdown-preview.enable
        then pkgs.vimPlugins.markdown-preview-nvim
        else null
      )
    ];

    vim.globals = mkIf cfg.glow.enable {
      "glow_binary_path" = "${pkgs.glow}/bin";
    };

    vim.configRC =
      if cfg.markdown-preview.enable
      then ''
        autocmd FileType markdown noremap <leader>p :MarkdownPreviewToggle<CR>
      ''
      else
        (
          if cfg.glow.enable
          then ''
            autocmd FileType markdown noremap <leader>p :Glow<CR>
          ''
          else null
        );
  };
}
