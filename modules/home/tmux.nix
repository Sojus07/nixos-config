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

        set-window-option -g clock-mode-colour colour167
        
        set -g default-terminal "screen-256color"
        set -g status-bg black
        set -g status-fg white
        set -g status-position top
        set -g status-left-length 64
        
        set -g status-style "bg=#1c1c1c,fg=#b6b7b7"
        set -g status-left  "#[bg=#1c1c1c,fg=#b6b7b7,bold] [#S]"
        set -g status-right "#[bg=#1c1c1c,fg=#b6b7b7] #{pane_title} #[bg=#1c1c1c,fg=#b6b7b7,bold] | %a %d %b | #[fg=#b6b7b7,bold]%H:%M "
        setw -g window-status-current-format "#[bg=#262626,fg=#b6b7b7,nobold,noitalics,nounderscore] #[bg=#262626,fg=#b6b7b7,bold] #I #[bg=#262626,fg=#b6b7b7,bold] #W#{?window_zoomed_flag,*Z,} #[bg=#1c1c1c,fg=#b6b7b7,nobold,noitalics,nounderscore]"
        setw -g window-status-format         "#[bg=#1c1c1c,fg=#b6b7b7,noitalics] #[bg=#1c1c1c,fg=#b6b7b7] #I #[bg=#1c1c1c,fg=#b6b7b7] #W #[bg=#1c1c1c,fg=#b6b7b7,noitalics]"

      '';
    };
  };
}
