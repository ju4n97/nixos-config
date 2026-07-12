{ config, pkgs, unstable, ... }:

{
  imports = [
    ../../modules/user/packages.nix
    ../../modules/user/apps.nix
    ../../modules/user/shell.nix
    ../../modules/user/xfce.nix
  ];

  home.username = "juan";
  home.homeDirectory = "/home/juan";
  
  home.sessionPath = [ ];
  
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}