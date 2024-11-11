{ config, pkgs, ... }:
{
    programs = {
        kitty = {
            enable = true;
            extraConfig = ''
                font_size 15.0
                cursor_shape beam
                close_window
            '';
        };
        tmux = {
            enable = true;
        };
    };
}
