{ config, pkgs, ... }:
{
  services = {
    sxhkd = {
      enable = true;
      keybindings = {
        "super + Return" = "${pkgs.alacritty}/bin/alacritty";
        "super + space" = "${pkgs.rofi}/bin/rofi -show drun";

        "super + shift + r" = "bspc restart";
        "super + shift + space" = "bspc node focused -t \~floating";
        "super + {1,2,3,4,5,6,7,8,9,0}" = "bspc desktop -f {1,2,3,4,5,6,7,8,9,0}";
        "super + shift + {1-9,0}" = "bspc node -d '^{1-9,10}'";
      };
    };
  };
  xsession.windowManager.bspwm = {
    enable = true;
    settings = {
      border_width = 2;
      gapless_monocle = false;
      split_ratio = 0.52;
    };
    extraConfig = ''
      feh --bg-fill ~/.wp/temple.png &
      bspc config focus_follows_pointer false
    '';
    rules = {
      "gimp" = {
        desktop = "^8";
        state = "floating";
        follow = true;
      };
      "kupfer.py" = {
        focus = true;
      };
      "screenkey" = {
        manage = false;
      };
    };
  };
}
