{
  pkgs,
  inputs,
  plugins,
  ...
}: final: prev: let
  inherit (prev.vimUtils) buildVimPlugin;

  treesitterGrammars = prev.tree-sitter.withPlugins (p: [
    p.tree-sitter-c
    p.tree-sitter-cpp
    p.tree-sitter-nix
    p.tree-sitter-python
    p.tree-sitter-rust
    p.tree-sitter-markdown
    p.tree-sitter-comment
    p.tree-sitter-toml
    p.tree-sitter-make
    p.tree-sitter-tsx
    p.tree-sitter-html
    p.tree-sitter-javascript
    p.tree-sitter-css
    p.tree-sitter-graphql
    p.tree-sitter-json
    p.tree-sitter-hcl
    p.tree-sitter-java
  ]);

  buildPlug = name:
    buildVimPlugin {
      pname = name;
      version = "master";
      src = builtins.getAttr name inputs;
      postPatch =
        if (name == "nvim-treesitter")
        then ''
          rm -r parser
          ln -s ${treesitterGrammars} parser
        ''
        else "";
    };
in {
  neovimPlugins = builtins.listToAttrs (map (name: {
      inherit name;
      value = buildPlug name;
    })
    plugins);
}
