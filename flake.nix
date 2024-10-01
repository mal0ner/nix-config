{
  description = "Cam's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
    ...
  } @ inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/desktop/configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [rust-overlay.overlays.default];
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cama = {pkgs, ...}: {
            imports = [./hosts/desktop/home.nix];
            home.packages = [pkgs.rust-bin.stable.latest.default];
          };
          home-manager.backupFileExtension = "backup";
        }
      ];
      specialArgs = {inherit inputs;};
    };

    homeConfigurations."cam@airbook" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        overlays = [rust-overlay.overlays.default];
        config = {
          allowUnfree = true;
        };
      };
      modules = [
        ./hosts/laptop-m1/home.nix
        ({pkgs, ...}: {
          home.packages = [pkgs.rust-bin.stable.latest.default];
        })
      ];
    };
  };
}
