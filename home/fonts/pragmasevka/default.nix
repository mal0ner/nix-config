{
  lib,
  stdenv,
  fontconfig,
}:
stdenv.mkDerivation rec {
  pname = "pragmasevka";
  version = "1.6.6";

  srcs = [
    ./pragmasevka-nf-regular.ttf
    ./pragmasevka-nf-bold.ttf
    ./pragmasevka-nf-italic.ttf
    ./pragmasevka-nf-bolditalic.ttf
  ];

  buildInputs = [fontconfig];
  phases = ["unpackPhase" "installPhase"];
  unpackPhase = ":";
  installPhase = ''
    mkdir -p $out/share/fonts/truetype/pragmasevka
    for font in $srcs; do
      cp $font $out/share/fonts/truetype/pragmasevka/
    done
  '';

  meta = with lib; {
    description = "Pragmasevka Nerd Font";
    platforms = platforms.all;
  };
}
