{ config, pkgs, ... }:
{
  security = {
    rtkit = {
      enable = true;
    };
    polkit = {
      enable = true;
    };
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
  environment.systemPackages = with pkgs; [
    polkit
    polkit_gnome
  ];
}
