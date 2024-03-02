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
