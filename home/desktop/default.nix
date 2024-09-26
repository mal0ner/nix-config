{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty
    obsidian
  ];
}
