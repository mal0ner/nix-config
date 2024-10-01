{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    kitty
    obsidian
  ];

  # move kitty configuration to correct location
  home.file = {
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/config/kitty";
  };
}
