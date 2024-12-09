{ config, pkgs, ... }:
{
  programs = {
    kitty = {
      enable = true;
      extraConfig = ''
        font_size 15.0
        cursor_shape beam
        close_window true
        confirm_os_window_close 0

      '';
    };
    tmux = {
      enable = true;
    };
  };
}
