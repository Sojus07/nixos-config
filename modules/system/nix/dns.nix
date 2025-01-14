{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dhcpcd
  ];
  networking = {
    nameservers = [
      "192.168.0.122"
      "1.1.1.1"
    ];
  };
}
