{
  pkgs,
  inputs,
  plugins,
  ...
}: {

  neovimBuilder = import ./neovimBuilder.nix {inherit pkgs;};

  buildPluginOverlay = import ./buildPlugin.nix {inherit pkgs inputs plugins;};
}
