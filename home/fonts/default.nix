{pkgs, ...}: let
  pragmasevka = pkgs.callPackage ./pragmasevka {};
in {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "ZedMono"
        "IosevkaTerm"
        "JetBrainsMono"
      ];
    })
    pragmasevka
  ];
}
