{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
with builtins; let
  cfg = config.vim.snippets.chatgpt;
in {
  imports = [
    ./vsnip.nix
  ];
  options.vim.snippets.chatgpt = {
    enable = mkEnableOption "Enable chatgpt";
  };

  config = mkIf cfg.enable {
    vim.startPlugins = with pkgs.neovimPlugins; [chatgpt nui telescope plenary-nvim];
    vim.luaConfigRC = ''
      require("chatgpt").setup({
        keymaps = {
          submit = "<C-s>"
        },
      })
    '';
    vim.nnoremap = {
      "<leader>cga" = "<cmd>ChatGPT<CR>";
      "<leader>cge" = "<cmd>ChatGPTEditWithInstructions<CR>";
    };
    vim.vnoremap = {
      "<leader>cge" = "<cmd>ChatGPTEditWithInstructions<CR>";
    };
  };
}
