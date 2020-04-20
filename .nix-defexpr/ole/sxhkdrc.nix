{
  stdenv,
  writeText,

  bindings ? []
}:

let
  mkBinding = {key, command}: key + "\n\t" + command;

  contents = builtins.concatStringsSep "\n\n" (map mkBinding bindings);

in stdenv.mkDerivation {
  name = "sxhkdrc";

  sxhkdrc = writeText "sxhkdrc" contents;

  phases = ["installPhase"];

  installPhase = ''
    mkdir -p $out/etc/sxhkd
    cp $sxhkdrc $out/etc/sxhkd/sxhkdrc
  '';
}
