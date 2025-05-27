{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = ''
      @define-color foreground #f2f4f8;
      @define-color background #161616;
      @define-color alt_background #1a1a1a;
      @define-color accent #3ddbd9;

      @define-color black #262626;
      @define-color red #ee5396;
      @define-color green #42be65;
      @define-color yellow #ffab91;
      @define-color blue #33b1ff;
      @define-color magenta #be95ff;
      @define-color cyan #3ddbd9;
      @define-color white #dde1e6;

      @define-color alt_black #262626;
      @define-color alt_red #ee5396;
      @define-color alt_green #42be65;
      @define-color alt_yellow #ffab91;
      @define-color alt_blue #33b1ff;
      @define-color alt_magenta #be95ff;
      @define-color alt_cyan #3ddbd9;
      @define-color alt_white #dde1e6;
    
      * {

        border: none;
        font-family: JetBrainsMono Nerd Font, sans-serif;
        font-size: 14px;
      }

      window#waybar {
        /* background-color: rgba(0, 0, 0, 0); */
        /* background-color: rgba(18, 21, 29, 0.98); */
        background-color: @background;
        border-radius: 6px;
        color: @foreground;
        opacity: 1;
        transition-property: background-color;
        transition-duration: .5s;
        margin-bottom: -7px;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      window#hyprland-window {
        background-color: @background;
      }

      #workspaces,
      #mode,
      #window,
      #cpu,
      #memory,
      #temperature,
      #custom-media,
      #custom-powermenu,
      #custom-fans,
      #custom-distro,
      #clock,
      #idle_inhibitor,
      #language,
      #pulseaudio,
      #backlight,
      #battery,
      #network,
      #tray {
        background-color: @alt_background;
        padding: 0 10px;
        margin: 5px 2px 5px 2px;
        border: 1px solid rgba(0, 0, 0, 0);
        border-radius: 6px;
        background-clip: padding-box;
      }

      #workspaces button {
        background-color: @alt_background;
        padding: 0 5px;
        min-width: 20px;
        color: @foreground;
      }

      #workspaces button:hover {
        background-color: rgba(0, 0, 0, 0)
      }

      #workspaces button.active {
        color: @accent;
      }

      #workspaces button.urgent {
        color: @red;
      }

      #cpu {
        padding: 0 10px;
        color: @alt_cyan;
      }

      #memory {
        padding: 0 10px;
        color: @alt_cyan;
      }

      #temperature {
        padding: 0 10px;
        color: @blue;
      }

      #temperature.critical {
        background-color: @red;
        padding: 0 10px;
        color: @background;
      }

      #custom-media {
        color: #c678dd;
        padding: 0 10px;
        color: @background;
      }

      #custom-fans {
        padding: 0 10px;
        color: @blue;
      }

      #clock {
        padding: 0 10px;
        color: @blue;
      }

      #idle_inhibitor {
        padding: 0 10px;
        color: @foreground;
      }

      #language {
        padding: 0 10px;
        color: @blue;
      }

      #pulseaudio {
        padding: 0 10px;
        color: @yellow;
      }

      #pulseaudio.muted {
        padding: 0 10px;
        background-color: @red;
        color: @background;
      }

      #backlight {
        padding: 0 10px;
        color: @yellow;
      }

      #battery {
        padding: 0 10px;
        color: @alt_green;
      }

      #battery.charging, #battery.plugged {
        padding: 0 10px;
        background-color: @alt_green;
        color: @background;
      }

      @keyframes blink {
          to {
              background-color: @background;
              color: @red;
          }
      }

      #battery.critical:not(.charging) {
          padding: 0 10px;
          background-color: @red;
          color: @background;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #network {
          padding: 0 10px;
          color: @blue;
      }

      #custom-distro {
          color: @accent;
          background-color: @background;
          font-size: 25px;
          margin: 1px;
          padding: 0px 0px 0px 6px;
      }

      #network.disconnected {
          padding: 0 10px;
          background-color: @red;
          color: @background;
      }
      #custom-powermenu {
          background-color: @red;
          color: @background;
          font-size: 15px;
          padding-right: 6px;
          padding-left: 11px;
          margin: 5px;
      }

    ''; 

    settings = {
      mainBar = {
        #margin = "8px 10px -2px 10px";
        margin = "0px 10px 8px 10px";
        layer = "top";
        position = "bottom";

        modules-left = [ "custom/distro" "battery" "sway/workspaces" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "cpu" "memory" "backlight" "pulseaudio" "network" "tray" "clock" ];

        "sway/workspaces" = {
          active-only = "false";
          disable-scroll = "true";
          all-outputs = "true";
          format = "{icon}";
          on-click = "activate";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };

        "tray" = {
          spacing = 8;
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = " {:%H:%M:%S}";
          format-alt = " {:%A, %B %d, %Y}";
        };

        "cpu" = {
          format = " {usage}%";
          tooltip = "false";
        };

        "memory" = {
          format = " {}%";
        };

        "backlight" = {
          format = "{icon}{percent}%";
          format-icons = ["󰃞 " "󰃟 " "󰃠 "];
          on-scroll-up = "light -A 1";
          on-scroll-down = "light -U 1";
        };

        "battery" = {
          states = {
            warning = "30";
            critical = "15";
          };
          format = "{icon}{capacity}%";
          tooltip-format = "{timeTo} {capacity}%";
          format-charging = "󱐋{capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["  " "  " "  " "  " "  "];
        };

        "network" = {
          format-wifi = " {essid} {signalStrength}%";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} 󰈀 ";
          format-linked = "{ifname} (No IP)  ";
          format-disconnected = "󰤮 Disconnected";
          on-click-release = "sleep 0";
          tooltip-format = "{essid} {signalStrength}%";
        };

        "pulseaudio" = {
          format = "{icon}{volume}% {format_source}";
          format-bluetooth = "{icon} {volume}%";
          format-bluetooth-muted = "   {volume}%";
          format-source = "";
          format-source-muted = "";
          format-muted = "  {format_source}";
          format-icons = {
            headphone = " ";
            phone = " ";
            portable = " ";
            default = [" " " " "  "];
          };
          tooltip-format = "{desc} {volume}%";
          on-click = "wpctl set-sink-mute @DEFAULT_SINK@ toggle";
          on-click-right = "wpctl set-source-mute @DEFAULT_SOURCE@ toggle";
          on-click-middle = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-release = "sleep 0";
          on-click-middle-release = "sleep 0";
        };

        "custom/distro" = {
          format = " ";
          on-click-release = "sleep 0";
        };
      };
    };
  };
}
