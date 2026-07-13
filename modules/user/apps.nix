{ pkgs, unstable, config, ... }:

{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    profiles.juan = {
      id = 0;
      name = "juan";
      isDefault = true;
      settings = {
        "browser.startup.page" = 3;
        "privacy.trackingprotection.enabled" = true;
        "layout.frame_rate" = 240; 
        "media.ffmpeg.vaapi.enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;
        "network.dns.disablePrefetch" = false;
        "network.http.speculative-parallel-limit" = 6;
        "network.prefetch-next" = false;
        "network.trr.mode" = 2;
        "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";
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