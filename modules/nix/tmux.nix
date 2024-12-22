{ config, pkgs, ... }:
{
  programs = {
    tmux = {
      enable = true;
      plugins = with pkgs; [
        tmuxPlugins.net-speed
        tmuxPlugins.cpu
        tmuxPlugins.battery
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
        set status-bg default
      '';
    };
  };
}
