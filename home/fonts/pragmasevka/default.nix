{
  lib,
  stdenv,
  fontconfig,
}:
stdenv.mkDerivation rec {
  pname = "pragmasevka";
  version = "1.6.6";

  src = ./pragmasevka-nf-regular.ttf;

  buildInputs = [fontconfig];
  phases = ["installPhase"];
  installPhase = ''
    mkdir -p $out/share/fonts
    cp ${src} $out/share/fonts/
  '';

  meta = with lib; {
    description = "Pragmasevka Nerd Font";
    platforms = platforms.all;
  };
}
