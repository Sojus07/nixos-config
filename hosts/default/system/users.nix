{ config, pkgs, ... }:
{
  security = {
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "fabian" ];
          noPass = true;
          keepEnv = true;
        }
      ];
    };
  };
  
  programs = {
    bash = {
      enableLsColors = true;
      completion = {
        enable = true;
        package = pkgs.bash-completion;
      };
      shellInit = ''
        case "$TERM" in
          xterm-color|*-256color) color_prompt=yes;;
        esac
      
        export DEVKITPRO="/opt/devkitpro"
        export DEVKITA64="$DEVKITPRO/devkitA64"
        export DEVKITARM="$DEVKITPRO/devkitARM"
        export DEVKITPPC="$DEVKITPRO/devkitPPC"
      '';

      shellAliases = {
        update = "sudo nixos-rebuild switch --flake /etc/nixos --impure";
        http = "python3 -m http.server 1337";
      };
    };
  };

  users = {
    users = {
      fabian = {
        useDefaultShell = true;
        isNormalUser = true;
        initialPassword = "1601";
        extraGroups = [
          "wheel"
          "docker"
          "audio"
          "video"
          "dialout"
          "plugdev"
          "adbusers"
          "kvm"
          "dialout"
        ];
      };
    };
  };
}
