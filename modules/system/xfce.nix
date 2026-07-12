{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "latam";
    
    # Display manager
    displayManager.lightdm.enable = true;
    
    # Desktop environment
    desktopManager.xfce.enable = true;
  };
}