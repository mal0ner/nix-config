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

    clang
  ];
}
