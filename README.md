# Nix Config

- Clone repo locally then install
```sh
git clone git@github:mal0ner/nix-config

sudo nixos-rebuild switch --flake path/to/nix-config

# or non-nixos / standalone home-manager
sudo nix run github:nix-community/home-manager -- switch --flake path/to/nix-config
```

- Alternatively, just install nix and rebuild from a public repo
```sh
sudo nixos-rebuild switch --flake github:mal0ner/nix-config

# on non-nixos / standalone home-manager
nix run github:nix-community/home-manager -- switch --flake github:mal0ner/nix-config
```
