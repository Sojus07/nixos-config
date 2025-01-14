{ config, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      gaps = {
        inner = 5;
        outer = 5;
      };
      bars = [
        {
          command = "${pkgs.feh}/bin/feh --bg-fill ~/.wp/gruvbox-dark-blue.png; i3status -c ~/.config/i3/i3status.conf";
        }
      ];
      keybindings = {

        # IMPORTANT STUFF #
        "Mod4+Return" = "exec alacritty ";
        "Mod4+space" = "exec ${pkgs.rofi}/bin/rofi -show run";
        "Mod4+Q" = "kill";
        "Mod4+Shift+R" = "restart";
        "Mod4+Shift+S" = "exec ${pkgs.flameshot}/bin/flameshot gui";

        # WINDOW STUFF #
        "Mod4+Shift+space" = "floating toggle";
        "Mod4+Shift+F" = "fullscreen toggle";
        "Mod4+Left" = "focus left";
        "Mod4+Down" = "focus down";
        "Mod4+Up" = "focus up";
        "Mod4+Right" = "focus right";

        "Mod4+Ctrl+Right" = "resize shrink width 3 px or 3 ppt";
        "Mod4+Ctrl+Down" = "resize grow height 3 px or 3 ppt";
        "Mod4+Ctrl+Up" = "resize shrink height 3 px or 3 ppt";
        "Mod4+Ctrl+Left" = "resize grow width 3 px or 3 ppt";

        "Mod4+Shift+Left" = "move left";
        "Mod4+Shift+Down" = "move down";
        "Mod4+Shift+Up" = "move up";
        "Mod4+Shift+Right" = "move right";

        # WORKSPACES #
        "Mod4+1" = "workspace number 1";
        "Mod4+2" = "workspace number 2";
        "Mod4+3" = "workspace number 3";
        "Mod4+4" = "workspace number 4";
        "Mod4+5" = "workspace number 5";
        "Mod4+6" = "workspace number 6";
        "Mod4+7" = "workspace number 7";
        "Mod4+8" = "workspace number 8";
        "Mod4+9" = "workspace number 9";

        # MOVE WINDOW TO OTHER WS #
        "Mod4+Shift+1" = "move container to workspace number 1";
        "Mod4+Shift+2" = "move container to workspace number 2";
        "Mod4+Shift+3" = "move container to workspace number 3";
        "Mod4+Shift+4" = "move container to workspace number 4";
        "Mod4+Shift+5" = "move container to workspace number 5";
        "Mod4+Shift+6" = "move container to workspace number 6";
        "Mod4+Shift+7" = "move container to workspace number 7";
        "Mod4+Shift+8" = "move container to workspace number 8";
        "Mod4+Shift+9" = "move container to workspace number 9";

        # Audio
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec set-volume toggle-mute";

        "XF86AudioStop" = "exec ${pkgs.playerctl}/bin/playerctl stop";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";

        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set   5%+";

      };
    };
    extraConfig = ''
      bar {
        position top
        status_command i3status -c /home/fabian/.config/i3/i3status.conf
        colors {
          background #161616
          statusline #FFFFFF
          separator  #FFFFFF

          focused_workspace  #458588 #458588 #ebdbb2
          active_workspace   #83a598 #83a598 #ebdbb2
          inactive_workspace #504945 #504945 #ebdbb2
          urgent_workspace   #cc241d #cc241d #504945
        } 
      }

      set $bg #161616
      set $red #cc241d
      set $green #98971a
      set $yellow #101010
      set $blue #458588
      set $purple #b16286
      set $aqua #689d68
      set $gray #a89984
      set $darkgray #161616

      floating_modifier Mod4

      client.focused          $green $green $darkgray $yellow $yellow
      client.focused_inactive $darkgray $darkgray $yellow $purple $darkgray
      client.unfocused        $darkgray $darkgray $yellow $purple $darkgray
      for_window [class="^.*"] border pixel 1
    '';
  };
}
