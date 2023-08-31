{
  pkgs,
  lib,
  ...
}:
with lib; {
  config = {
    vim.git = {
      enable = mkDefault false;
      gitsigns.enable = mkDefault false;
    };
    vim.nnoremap = {
      "<silent><leader>gor" = ":! ${pkgs.gh}/bin/gh repo view -w <CR>";
      "<silent><leader>gop" = ":! ${pkgs.gh}/bin/gh pr view -w <CR>";
    };
  };
}
