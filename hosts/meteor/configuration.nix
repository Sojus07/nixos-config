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
    ./modules/default.nix
    ../default/default.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "freeimage-unstable-2021-11-01"
      ];
    };
  };
  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
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

  xdg.portal = {
    enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs = {
    nix-ld.enable = true;
    fish.enable = true;
  };

  environment.etc = {
    "makepkg.conf".source = "${pkgs.pacman}/etc/makepkg.conf";
    "pacman.conf".source = ../default/raw/pacman.conf;
  };

  system.stateVersion = "unstable";

}
