{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      # LSP
      gopls
      sumneko-lua-language-server
      rust-analyzer
      clang-tools
      ruff-lsp
      pyright
      nil

      # FORMAT
      alejandra
      stylua
      gofumpt

      # TypeScript
      nodejs
      nodePackages.typescript-language-server
    ];
  };
}
