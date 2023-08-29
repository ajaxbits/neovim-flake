{
  pkgs,
  origPackage,
  newBinName,
  ...
}:
pkgs.stdenv.mkDerivation {
  name = newBinName;
  buildInputs = [origPackage];
  buildCommand = ''
    mkdir -p $out/bin
    ln -s ${origPackage}/bin/nvim $out/bin/${newBinName}
  '';
}
