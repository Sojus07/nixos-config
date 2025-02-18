{ config, pkgs, ... }:
{
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [
        80
        1337
        8080
        3000
        8000
      ];
    };
  };
  
}
