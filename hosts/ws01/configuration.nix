{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/base.nix
    ../../modules/system/xfce.nix
    ../../modules/system/nvidia.nix 
  ];

  networking.hostName = "ws01";

  users.users.juan = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  system.stateVersion = "24.05";
}