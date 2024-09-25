{...}: {
  programs.home-manager.enable = true;

  imports = [
    ../../home/cli
    ../../home/desktop
    ../../home/development
    ../../home/fonts
  ];

  # desktop specific user programs
  programs.firefox.enable = true;

  home = {
    username = "cama";
    homeDirectory = "/home/cama";
    stateVersion = "24.05";
  };
}
