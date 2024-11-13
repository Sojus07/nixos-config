{ config, pkgs, ... }:
{
  xsession.windowManager.herbstluftwm = {
    enable = true;
    keybinds = {
      Mod4-Return = "${pkgs.alacritty}/bin/alacritty";
      Mod4-space = "${pkgs.rofi}/bin/rofi -show drun";
    };
    settings = {
      gapless_grid = false;
      window_border_width = 1;
      window_border_active_color = "#FF0000";
    };
  };
}
