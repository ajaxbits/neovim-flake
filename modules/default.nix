{...}: {
  imports = [
    # WARN: Order matters here, if you can believe it...
    ./treesitter
    ./completion
    ./theme
    ./core
    ./basic
    ./statusline
    ./tabline
    ./filetree
    ./visuals
    ./lsp
    ./tidal
    ./autopairs
    ./snippets
    ./keys
    ./markdown
    ./telescope
    ./git
    ./surround
    ./project-management
    ./leetcode
  ];
}
