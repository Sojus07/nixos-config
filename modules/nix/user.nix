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
        PS1="\[\e[38;5;216m\]\u\[\e[38;5;220m\]@\[\e[38;5;222m\]\h \[\e[38;5;229m\]\w \[\033[0m\]% "

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
        bind t new-window
        bind -n M-q previous-window
        bind -n M-e next-window
        bind r source-file ~/.tmux.conf
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D
        set -g status-position top


        set -g @net_speed_interfaces "wg0-mullvad"
        set -g @download_speed_format "%10s"
        set -g @upload_speed_format "%10s"
        set -g @net_speed_format "D:%10s U:%10s"
        set -g status-right '#{cpu_bg_color} CPU: #{cpu_icon} #{cpu_percentage} | %a %h-%d %H:%M '
      '';
    };
  };
}
