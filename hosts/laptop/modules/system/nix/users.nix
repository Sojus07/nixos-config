{ config, pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.fish;
    users = {
      fabian = {
        useDefaultShell = true;
        shell = pkgs.fish;
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
