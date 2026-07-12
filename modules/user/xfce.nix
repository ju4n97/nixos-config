{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofimoji
    flameshot
    gnome-keyring
    xcolor
    xsel
  ];

  programs.rofi = {
    enable = true;
  };

  services.sxhkd = {
    enable = true;
    keybindings = {
      "Print" = "flameshot gui";
      "super + space" = "rofi -show combi -combi-modes 'window,run,ssh' -modes combi";
      "super + shift + e" = "rofimoji";
      "super + shift + c" = "xcolor | xsel -ib";
      "super + shift + x" = "find ~/Projects -mindepth 1 -maxdepth 1 -type d | rofi -dmenu -i | xargs -r -I{} code {}";
    };
  };

  xfconf.settings = {
    xfwm4 = {
      "general/workspace_count" = 2;
      "general/workspace_1_key" = "<Super>1";   
      "general/workspace_2_key" = "<Super>2";
    };
    pointers = {
      "Mouse_Name/Acceleration" = 1.0;
    };
  };
}