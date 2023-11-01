{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # WARN: Order matters here, if you can believe it...
    ./completion
    ./theme
    ./core
    ./basic
    ./statusline
    ./tabline
    ./filetree
    ./visuals
    ./lsp
    ./treesitter
    ./tidal
    ./autopairs
    ./keys
    ./markdown
    ./telescope
    ./git
    ./surround
    ./project-management
  ];
}
