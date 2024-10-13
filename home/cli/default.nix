{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # essential
    git
    tmux

    # workflow
    starship
    zoxide
    yazi
    bat
    eza
    btop
    rm-improved
    wget
    lazygit
    atuin

    # search / text manipulation
    fd
    fzf
    ripgrep
    jq
    yq
    jqp

    # tools
    unzip
    httpie
  ];

  home.sessionVariables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  home.file = {
    ".config/starship".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/config/starship";
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/config/fish";
    ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/config/tmux";
    ".config/atuin".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/config/atuin";
  };

  manual.manpages.enable = true;
  news.display = "show";
}
