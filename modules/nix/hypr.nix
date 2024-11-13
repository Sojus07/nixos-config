{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      windowrulev2 = opacity 0.0 override, class:^(xwaylandvideobridge)$
      windowrulev2 = noanim, class:^(xwaylandvideobridge)$
      windowrulev2 = noinitialfocus, class:^(xwaylandvideobridge)$
      windowrulev2 = maxsize 1 1, class:^(xwaylandvideobridge)$
      windowrulev2 = noblur, class:^(xwaylandvideobridge)$

      bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindl = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindl = , XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause
      bindl = , XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous
      bindl = , XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next

    '';
    settings = {
      "monitor" = "HDMI-A-2, 2560x1440@144, 0x0, 1";
      "$mod" = "SUPER";
      exec-once = [
        "waybar &"
        "${pkgs.swaybg}/bin/swaybg -i ~/.wp/temple.png"
      ];
      bind = [
        "$mod, RETURN, exec, ${pkgs.kitty}/bin/kitty"
        "$mod, space, exec, ${pkgs.wofi}/bin/wofi --show drun"
        "$mod, Q, killactive"
        "$mod SHIFT, space, togglefloating"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"

        #"bind = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        #"bind = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        #"bind = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        #"bind = ,XF86AudioPlay, exec, playerctl play-pause"
        #"bind = ,XF86AudioPrev, exec, playerctl previous"
        #"bind = ,XF86AudioNext, exec, playerctl next"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      decoration = {
        rounding = 2;
      };
      general = {
        gaps_in = 8;
        gaps_out = 8;
        border_size = 1;
        resize_on_border = true;
      };
      input = {
        kb_layout = "us";
        natural_scroll = false;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };
    };
  };
}
