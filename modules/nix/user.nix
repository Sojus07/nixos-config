{ config, pkgs, ... }:
{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      sessionVariables = {
        DEVKITPRO = "/opt/devkitpro";
        DEVKITPPC = "/opt/devkitpro/devkitPPC";
        DEVKITA64 = "/opt/devkitpro/devkitA64";
        DEVKITARM = "/opt/devkitpro/devkitARM";
        PATH = "/opt/devkitpro/tools/bin:$PATH";
      };
      shellAliases = {
        http = "python3 -m http.server";
        rm = "rm -rfv";
        ls = "${pkgs.eza}/bin/eza -l --icons";
        cp = "cp -rv";
        mv = "mv -v";
        mkdir = "mkdir -pv";
        update = "sudo nixos-rebuild switch";
      };
      shellOptions = [
        "histappend"
        "checkwinsize"
        "extglob"
        "globstar"
        "checkjobs"
      ];
      initExtra = ''
        eval "$(fzf --bash)"
        PS1='\[\e[35m\][\u@\h:\w] % \[\e[0m\]'

        if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
          tmux attach-session -t default || tmux new-session -s default
        fi

      '';
    };
    git = {
      enable = true;
      userName = "meml0rz";
      userEmail = "meml0rz";
    };
    tmux = {
      enable = true;
      plugins = with pkgs; [
        tmuxPlugins.net-speed
        tmuxPlugins.cpu
        tmuxPlugins.battery
        tmuxPlugins.gruvbox
      ];
      disableConfirmationPrompt = true;
      mouse = true;
      keyMode = "vi";
      extraConfig = ''
        unbind C-b
        set-option -g prefix C-a
        bind-key C-a send-prefix 
        bind \\ split-window -h
        bind - split-window -v
        unbind '"'
        unbind %

        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D

        set -g status-position top
      '';
    };
  };
}
