{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Sao_Paulo";
 
 console.useXkbConfig = true;
  services = {
   displayManager.ly.enable = true;
   flatpak.enable = true;
   gvfs.enable = true;
   picom = {
    enable = true;
    backend = "glx";
    vSync = true;
   };
   xserver = {
    enable = true;
    enableTearFree = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    xkb = {
     layout = "br";
     variant = "abnt2";
    };
    displayManager.sessionCommands = "xwallpaper --zoom ~/nixos-dotfiles/walls/wall1.jpg";
    windowManager.i3 = {
     enable = true;
     extraPackages = with pkgs; [
      i3status
      polybar
     ];
    }; 
   };
  };
  programs = {
   steam.enable = true;
   java = {
    package = with pkgs; [
     jdk17
     jdk8
    ];
   };
  };
  xdg.portal = { #flatpak dependency
   enable = true;
   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
   config.common.default = "*";
  };
  users.users.snece = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    kitty
    git
  ];

  fonts.packages = with pkgs; [
   iosevka-comfy.comfy
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}

