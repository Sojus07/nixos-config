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
  };
  
}
