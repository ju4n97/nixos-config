{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    eza
    fastfetch
    fd
    fzf
    go-task
    htop
    p7zip
    ripgrep
    tree
    xclip
    zoxide    
  ];
}