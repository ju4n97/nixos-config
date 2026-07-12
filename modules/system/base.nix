{ config, pkgs, ... }:

{
  # Boot subsystem
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network and locale
  networking.networkmanager.enable = true;
  time.timeZone = "America/Bogota";
  console.keyMap = "la-latin1";

  # Virtualization backend
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.guest.enable = true;

  # Shell configuration
  programs.zsh.enable = true;

  # Package manager configuration
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
  ];
}