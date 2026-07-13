{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    eza
    fastfetch
    fd
    ffmpeg
    fzf
    htop
    jq
    less
    mpv
    p7zip
    ripgrep
    tree
    unzip
    vim
    wget
    wl-clipboard
    xdg-utils
    zip
    zoxide
  ];
}