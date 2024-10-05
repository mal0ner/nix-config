{pkgs, ...}: {
  imports = [
    ./nvim.nix
  ];

  home.packages = with pkgs; [
    go
    delve
    gotests
    gotools
    go-tools
    gomodifytags
    impl

    lua

    nodejs

    clang

    php
    php83Packages.composer
  ];
}
