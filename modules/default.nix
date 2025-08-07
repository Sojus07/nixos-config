{ config, pkgs, ... }:
{
  imports = [
    ./pkgs.nix
    ./services.nix
    ./users.nix
    ./firefox.nix
    ./git.nix
    ./tmux.nix
    #./alacritty.nix
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
