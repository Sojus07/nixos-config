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
        bind -n M-w previous-window
        bind -n M-e next-window
        bind r source-file ~/.config/tmux/tmux.conf
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D

        setw -g window-status-current-format "#T(#I:#W#F)"  
        setw -g window-status-format "#T(#I:#W#F)"  

        set-option -s status-interval 1
        set -g status-right-length 100
        set -g @net_speed_interfaces "wg0-mullvad"
        set -g @download_speed_format "%1s"
        set -g @upload_speed_format "%1s"
        set -g @net_speed_format "D:%1s U:%1s"

        set -g status-right '#{battery_icon} #{battery_percentage} [󰈀  #{net_speed}] [   #{cpu_percentage}] [  %H:%M] '

        run-shell ${pkgs.tmuxPlugins.net-speed}/share/tmux-plugins/net-speed/net_speed.tmux 
        run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
        #run-shell ${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux

        set -g status-position top
        set-option -g status-style bg=default
      '';
    };
  };
}
