{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  imports = [
    ../../pkgs
  ];

  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "ZedMono"
        "IosevkaTerm"
        "JetBrainsMono"
      ];
    })
    pkgs.custom.pragmasevka
  ];
}
