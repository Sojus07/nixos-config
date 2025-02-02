{ config, pkgs, ... }:
{
  networking = {
    hostName = "poggers";
    networkmanager.enable = true;
    firewall = {
      enable = true;
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
