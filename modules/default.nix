{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./autopairs
    ./basic
    ./completion
    ./core
    ./filetree
    ./git
    ./keys
    ./lsp
    ./markdown
    ./snippets
    ./statusline
    ./surround
    ./tabline
    ./telescope
    ./theme
    ./tidal
    ./treesitter
    ./visuals
  ];
}
