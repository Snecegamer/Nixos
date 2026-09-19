{ config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    neovim
    ripgrep
    lazygit
    luaPackages.tree-sitter-cli
    gcc16
    fzf
    ripgrep
    fd
  ];
}
