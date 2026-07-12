{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.readFile ./conf/ohmyposh.json);
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --color=auto";
      la = "eza --color=auto -la";
      task = "go-task";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#$(hostname)";
    };

    history = {
      size = 5000;
      save = 5000;
      path = "$HOME/.zsh_history";
      ignoreAllDups = true;
      share = true;
    };

    initExtra = ''
      ZINIT_HOME="''${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
      if [[ ! -d "$ZINIT_HOME/.git" ]]; then
          mkdir -p "''${ZINIT_HOME:h}"
          ${pkgs.git}/bin/git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
      fi
      source "$ZINIT_HOME/zinit.zsh"
      zinit light zsh-users/zsh-completions
      zinit light Aloxaf/fzf-tab
      zinit cdreplay -q

      bindkey -v
      bindkey -M viins 'jk' vi-cmd-mode
      
      autoload -Uz history-search-end
      zle -N history-search-backward-end history-search-backward-end
      zle -N history-search-forward-end history-search-forward-end
      bindkey '^P' history-search-backward-end
      bindkey '^N' history-search-forward-end

      vi-yank-clipboard() {
          zle vi-yank
          print -rn -- "$CUTBUFFER" | xclip -selection clipboard
      }
      zle -N vi-yank-clipboard
      bindkey -M vicmd 'y' vi-yank-clipboard
      
      expand-alias() { zle _expand_alias; }
      zle -N expand-alias
      bindkey '^ ' expand-alias
    '';
  };

  programs.fzf.enable = true;
  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };
}