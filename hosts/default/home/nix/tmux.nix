{ config, pkgs, ... }:
{
  programs = {
    tmux = {
      enable = true;
      disableConfirmationPrompt = true;
      mouse = true;
      keyMode = "vi";
      extraConfig = ''
        if "test ! -d ~/.tmux/plugins/tpm" \
          "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

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
        bind r source-file ~/.tmux.conf
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D

        set-option -s status-interval 1
        set -g status-left-length 100
        set -g status-right-length 100
        set -g status-position top

        ### NOVA ###

        set -g @plugin 'o0th/tmux-nova'

        set -g @nova-nerdfonts true
        set -g @nova-nerdfonts-left 
        set -g @nova-nerdfonts-right 

        set -g @nova-pane-active-border-style "#44475a"
        set -g @nova-pane-border-style "#282a36"
        set -g @nova-status-style-bg "#121212"
        set -g @nova-status-style-fg "#d8dee9"
        set -g @nova-status-style-active-bg "#af87ff"
        set -g @nova-status-style-active-fg "#121212"
        set -g @nova-status-style-double-bg "#2d3540"

        set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"

        set -g @nova-segment-mode "#{?client_prefix,Ω,ω}"
        set -g @nova-segment-mode-colors "#af87ff #121212"

        set -g @nova-segment-whoami "#(whoami)@#h"
        set -g @nova-segment-whoami-colors "#af87ff #121212"

        set -g @nova-segment-date " %H:%M:%S"
        set -g @nova-segment-date-colors "#87afff #121212"

        set -g @nova-rows 0
        set -g @nova-segments-0-left "mode"
        set -g @nova-segments-0-right "date whoami "


        ### END ###

        run-shell ~/.tmux/plugins/tmux-nova/nova.tmux
        run '~/.tmux/plugins/tpm/tpm'
                

      '';
    };
  };
}
