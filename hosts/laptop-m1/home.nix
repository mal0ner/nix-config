{...}: {
  programs.home-manager.enable = true;

  imports = [
    ../../home/cli
    ../../home/desktop
    ../../home/development
    ../../home/fonts
  ];

  home = {
    username = "cama";
    homeDirectory = "/Users/cama";
    stateVersion = "24.05";

    sessionPath = [
      "/opt/homebrew/bin"
    ];
  };
}
