# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = ["nix-command" "flakes"];
  networking.networkmanager.enable = true; # Enable networking

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.displayManager.gdm.wayland = true;
  # services.displayManager.defaultSession = "hyprland";
  services.displayManager.defaultSession = "plasma";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # fix unfortunate linking issues
  programs.nix-ld.enable = true;
  # programs.nix-ld.libraries = {
  #   # ADD missing dynamic libraries for unpackaged
  #   # programs HERE, NOT in environment.systemPackages
  # };

  programs.fish.enable = true;

  # Docker
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cama = {
    isNormalUser = true;
    description = "Cameron Malone";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.fish;
    useDefaultShell = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # ADDED HYPRLAND ------------------
  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  environment.variables = {
    EDITOR = "nvim";
  };

  # Enable OpenGL
  hardware.graphics.enable = true;

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true; # Modesetting is required.
    powerManagement.enable = false; # Nvidia power management. Experimental
    powerManagement.finegrained = false; # Turns off GPU when not in use.
    open = false; # nVidia open source (first party not noveau) not stable so false
    nvidiaSettings = true; # Enable the Nvidia settings menu,
    package = config.boot.kernelPackages.nvidiaPackages.stable; # Optional, select the appropriate driver version for your GPU.
  };

  xdg.portal.enable = true;
  # xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  # END ADDED HYPRLAND ------------------

  environment.systemPackages = with pkgs; [
    wl-clipboard-rs
    vesktop # wayland discord
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.ssh.startAgent = true;
  programs.ssh.enableAskPassword = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
