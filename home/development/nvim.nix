{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      gopls # Go
      sumneko-lua-language-server # Lua
      rust-analyzer # Rust
      clang-tools # C/C++
      ruff-lsp # Python Lint
      pyright # Python

      nil # Nix LSP
      alejandra # Nix Formatter
    ];
  };
}
