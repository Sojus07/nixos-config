{ config, pkgs, ... }:
{
  programs = {
    tmux = {
      enable = true;
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
        set -g status-left "#[bg=black,fg=white,bold] [#S]"
        set -g status-right-length 64
        set -g status-right "#[bg=black,fg=white] #{pane_title} #[bg=black,fg=white,bold] | #[bg=black,fg=white,bold] %a %d %b | #[fg=white,bold]%H:%M "

        set-window-option -g window-status-current-format "#[bg=white,fg=black,nobold,noitalics,nounderscore] #[bg=white,fg=black,bold] #I #[bg=white,fg=black,bold] #W#{?window_zoomed_flag,*Z,} #[bg=black,fg=white,nobold,noitalics,nounderscore]"
        set-window-option -g window-status-format "#[bg=black,fg=white,noitalics] #[bg=black,fg=white] #I #[bg=black,fg=white] #W #[bg=black,fg=white,noitalics]"           
      

      '';
    };
  };
}
