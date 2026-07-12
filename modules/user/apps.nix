{ pkgs, unstable, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.juan = {
      id = 0;
      name = "juan";
      isDefault = true;
      settings = {
        "browser.startup.page" = 3;
        "privacy.trackingprotection.enabled" = true;
      };
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode-fhs;
  };

  home.packages = [ unstable.zed-editor ];
  xdg.configFile."zed/settings.json".text = builtins.toJSON {
    theme = "One Dark";
    vim_mode = true;
    ui_font_size = 16;
  };

  programs.gh.enable = true;
}