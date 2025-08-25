{ config, pkgs, ... }:
{
  programs = {
    tmux = {
      enable = true;
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
        bind -n M-w previous-window
        bind -n M-e next-window
        bind r source-file ~/.config/tmux/tmux.conf
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D

        set -g base-index 1
        set -g renumber-windows on
        set -g default-terminal "screen-256color"
        set -g status-bg default
        set -g status-fg default
        set -g status-style "bg=default,fg=default"
        set -g status-position top
        set -g status-left " #S "
        set -g status-right " %H:%M "
        setw -g window-status-current-format " [ #W ] "
        setw -g window-status-format "  #W  "
      '';
    };
  };
}

