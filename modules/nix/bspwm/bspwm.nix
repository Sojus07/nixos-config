{
  config,
  pkgs,
  pkgs-stable,
  ...
}:
{
  services = {
    sxhkd = {
      enable = true;
      keybindings = {
        "super + Return" = "${pkgs.alacritty}/bin/alacritty";
        "super + space" = "${pkgs.rofi}/bin/rofi -show drun";
        "super + q" = "bspc node -k";

        "super + shift + r" = "bspc wm -r";
        "super + shift + space" = "bspc node focused -t \~floating";
        "super + {1,2,3,4,5,6,7,8,9,0}" = "bspc desktop -f {1,2,3,4,5,6,7,8,9,0}";
        "super + shift + {1-9,0}" = "bspc node -d '^{1-9,10}'";
        "super + Escape" = "pkill -USR1 -x sxhkd";
      };
    };
  };
  xsession.windowManager.bspwm = {
    enable = true;
    settings = {
      border_width = 2;
      gapless_monocle = false;
      split_ratio = 0.52;
      window_gap = "10";
      focus_follows_pointer = true;
      borderless_monocle = true;
    };
    extraConfig = ''
      sxhkd -c ~/.config/sxhkd/sxhkdrc & 
      ${pkgs.feh}/bin/feh --bg-fill ~/.wp/anime_blue.png &
      bspc monitor -d 1 2 3 4 5 6 7 8 9 0


    '';
    rules = {
      "kupfer.py" = {
        focus = true;
      };
      "screenkey" = {
        manage = false;
      };
    };
  };
}
