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
    "pacman.conf".text = ''
      [options]
      HoldPkg     = pacman glibc
      UseSyslog
      Color
      ILoveCandy
      CheckSpace
      VerbosePkgLists
      ParallelDownloads = 5
      SigLevel    = Never

      [dkp-libs]
      Server = https://pkg.devkitpro.org/packages

      [dkp-linux]
      Server = https://pkg.devkitpro.org/packages/linux/x86_64/
    '';
  };

  system.stateVersion = "25.05";

}
