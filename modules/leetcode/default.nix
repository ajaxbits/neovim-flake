{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkForce mkIf mkOption types;
  cfg = config.vim.leetcode;
in {
  options.vim.leetcode = {
    enable = mkEnableOption "LeetCode mode enable";
    language = mkOption {
      # TODO: make into an enum?
      type = types.enum [
        # defined: https://github.com/kawre/leetcode.nvim/blob/b66911fae6df76e852bd42f01d140dba441e47df/lua/leetcode/config/template.lua
        "cpp"
        "java"
        "python"
        "python3"
        "c"
        "csharp"
        "javascript"
        "typescript"
        "php"
        "swift"
        "kotlin"
        "dart"
        "golang"
        "ruby"
        "scala"
        "rust"
        "racket"
        "erlang"
        "elixir"
        "bash"
        "html"
        "pythonml"
        "react"
        "vanillajs"
      ];
      description = "Default language to launch leetcode in.";
    };
  };

  config = mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [
      leetcode
      nui
      nvim-notify
      nvim-treesitter # also make sure tree-sitter-html grammar is installed
      nvim-web-devicons
      telescope
    ];

    vim.telescope.enable = true;
    vim.visuals.nvimWebDevicons.enable = true;
    vim.treesitter.enable = true;

    vim.luaConfigRC = ''
      -- leetcode
      require("leetcode").setup({
        lang = "${cfg.language}",
      })

      vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
    '';

    vim.nnoremap = {
      "<leader>lr" = mkForce "<cmd>Leet run<cr>";
      "<leader>ls" = mkForce "<cmd>Leet submit<cr>";
      "<leader>lc" = mkForce "<cmd>Leet console<cr>";
      "<C-n>" = mkForce "<cmd>Leet desc toggle<cr>";
      "<leader>li" = mkForce "<cmd>Leet info<cr>";

      "<leader>lm" = mkForce "<cmd>Leet menu<cr>";
      "<leader>lt" = mkForce "<cmd>Leet tabs<cr>";
      "<leader>lf" = mkForce "function() vim.lsp.buf.format { async = true } end";
    };
  };
}
