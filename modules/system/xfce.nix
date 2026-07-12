{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "latam";    
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };
}