{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
   nvim = "nvim";
   rofi = "rofi";
   i3 = "i3";
   polybar = "polybar";
   picom = "picom";
  };
in
{
 imports = 
   [
     ./modules/neovim.nix
   ];
 home.username = "snece";
 home.homeDirectory = "/home/snece";
 programs.git.enable = true;
 home.stateVersion = "26.05";
 programs.bash = {
 enable = true;
 bashrcExtra = "fastfetch";
 shellAliases = {
   btw = "echo i use NixOS btw";
  };
 };

 xdg.configFile = builtins.mapAttrs (name: subpath: {
   source =  create_symlink "${dotfiles}/${subpath}";
   recursive = true;
 }) configs;

 home.packages = with pkgs; [
  steam
  brave
  picom
  flameshot
  xwallpaper
  feh
  vlc
  rofi
  flatpak
  onlyoffice-desktopeditors
  thunar
  gvfs
  fastfetch
  unrar
  unzip
  networkmanagerapplet
  arduino-ide
 ];
}
