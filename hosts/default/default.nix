{ config, pkgs, ... }:
{
  imports = [
    ./system/dwm/default.nix
    ./system/editors/nvim/default.nix
    ./system/pkgs.nix
    ./system/services.nix
    ./system/users.nix
    ./system/firefox.nix
    ./system/sdr/default.nix
  ];

  hardware = {
    bluetooth = {
      enable = true;
    };
    graphics = {
      enable = true;
    };
  };
  virtualisation = {
    docker = {
      enable = true;
    };
  };
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
