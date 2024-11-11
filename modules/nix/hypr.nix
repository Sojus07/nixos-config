{config, pkgs, ... }: 
{
    wayland.windowManager.hyprland = { 
        enable = true;
        xwayland.enable = true;
        settings = {
            "monitor" =  "eDP-1, 1920x1080@60, 0x0, 1";
            "$mod" = "SUPER";
            bind = [
                "$mod, RETURN, exec, ${pkgs.kitty}/bin/kitty"
                "$mod, space, exec, ${pkgs.wofi}/bin/wofi --show drun"
                "$mod, Q, killactive"
                
                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"
                
                "bind = $mod SHIFT, 1, movetoworkspace, 1"
                "bind = $mod SHIFT, 2, movetoworkspace, 2"
                "bind = $mod SHIFT, 3, movetoworkspace, 3"
                "bind = $mod SHIFT, 4, movetoworkspace, 4"
                "bind = $mod SHIFT, 5, movetoworkspace, 5"
                "bind = $mod SHIFT, 6, movetoworkspace, 6"
                "bind = $mod SHIFT, 7, movetoworkspace, 7"
                "bind = $mod SHIFT, 8, movetoworkspace, 8"
                "bind = $mod SHIFT, 9, movetoworkspace, 9"

            ];
            decoration = {
                rounding = 0;
            };
            general = {
                gaps_in = 8;
                gaps_out = 8;
                border_size = 1;
                resize_on_border = true;
            };
            input = {
                kb_layout = "us";
                natural_scroll = true;
            };
            gestures = {
                workspace_swipe = true;
                workspace_swipe_forever = true; 
            };
        };
    };
}

