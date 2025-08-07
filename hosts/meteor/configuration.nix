{
  config,
  lib,
  pkgs,
  ...
}:
{
  networking.hostName = "meteor";

  imports = [
    ./hardware-configuration.nix
    ../../modules/default.nix
  ];
  
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
    };
    supportedFilesystems = [ "ntfs" ];
  };
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "freeimage-unstable-2021-11-01"
      ];
    };
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  systemd = {
    services = {
      modem-manager.enable = false;
      mpd.environment = {
        XDG_RUNTIME_DIR = "/run/user/1000";
      };
    };
  };
  
  time.timeZone = "Europe/Berlin";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  programs = {
    nix-ld.enable = true;
    dconf = {
      enable = true;
    };
  };
  
  system.stateVersion = "25.05";

}
