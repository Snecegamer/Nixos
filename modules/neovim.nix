{ config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc16
  ];
}
