{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    iperf3
    speedtest-cli
    dhcpcd
  ];

  services = {
    iperf3 = {
      enable = true;
    };
  };
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [
        80
        1337
        5001
        8080
        3000
        8000
      ];
    };
  };
  
}
